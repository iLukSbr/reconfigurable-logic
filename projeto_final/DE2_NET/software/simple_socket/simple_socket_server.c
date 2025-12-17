/******************************************************************************
* Copyright (c) 2006 Altera Corporation, San Jose, California, USA.           *
* All rights reserved. All use of this software and documentation is          *
* subject to the License Agreement located at the end of this file below.     *
 *******************************************************************************
 * Date - October 24, 2006                                                     *
 * Module - simple_socket_server.c                                             *
 *                                                                             *
 ******************************************************************************/

/******************************************************************************
  * Simple Socket Server (SSS) example.
  *
  * This example demonstrates the use of MicroC/OS-II running on NIOS II.
  * In addition it is to serve as a good starting point for designs using
  * MicroC/OS-II and Altera NicheStack TCP/IP Stack - NIOS II Edition.
  *
  * -Known Issues
  *     None.
  *
  * Please refer to the Altera NicheStack Tutorial documentation for details on this
  * software example, as well as details on how to configure the NicheStack TCP/IP
  * networking stack and MicroC/OS-II Real-Time Operating System.
  */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

/* Forward declarations for network functions to avoid implicit declaration warnings */
int inet_pton(int af, const char *src, void *dst);
int shutdown(int sockfd, int how);

/* MicroC/OS-II definitions */
#include "includes.h"

/* Simple Socket Server definitions */
#include "simple_socket_server.h"
#include "alt_error_handler.h"

/* Nichestack definitions */
#include "ipport.h"
#include "tcpport.h"
#include <io.h>
#include <fcntl.h>
//#include "BASICTYP.h"
#include "system.h"
#include "basic_io.h"

#include "semaforo.h"
#include "semaforo_hw.h"

#define IPPROTO_TCP 6

/* Function prototypes */
void SSSRXTask(void);
void SSSTXTask(void);

/*
 * Global handles (pointers) to our MicroC/OS-II resources. All of resources
 * beginning with "SSS" are declared and created in this file.
 */

/*
 * This SSSLEDCommandQ MicroC/OS-II message queue will be used to communicate
 * between the simple socket server task and Nios Development Board LED control
 * tasks.
 *
 * Handle to our MicroC/OS-II Command Queue and variable definitions related to
 * the Q for sending commands received on the TCP-IP socket from the
 * SSSSimpleSocketServerTask to the LEDManagementTask.
 */
OS_EVENT  *SSSLEDCommandQ;
#define SSS_LED_COMMAND_Q_SIZE  30  /* Message capacity of SSSLEDCommandQ */
void *SSSLEDCommandQTbl[SSS_LED_COMMAND_Q_SIZE]; /*Storage for SSSLEDCommandQ*/


/*
 * Handle to our MicroC/OS-II LED Event Flag.  Each flag corresponds to one of
 * the LEDs on the Nios Development board, D0 - D7.
 */
OS_FLAG_GRP *SSSLEDEventFlag;

/*
 * Handle to our MicroC/OS-II LED Lightshow Semaphore. The semaphore is checked
 * by the LED7SegLightshowTask each time it updates 7 segment LED displays,
 * U8 and U9.  The LEDManagementTask grabs the semaphore away from the lightshow task to
 * toggle the lightshow off, and gives up the semaphore to turn the lightshow
 * back on.  The LEDManagementTask does this in response to the CMD_LEDS_LIGHTSHOW
 * command sent from the SSSSimpleSocketServerTask when the user sends a toggle
 * lightshow command over the TCPIP socket.
 */
OS_EVENT *SSSLEDLightshowSem;

/* Definition of Task Stacks for tasks not invoked by TK_NEWTASK
 * (do not use NicheStack)
 */

OS_STK    LEDManagementTaskStk[TASK_STACKSIZE];
OS_STK    LED7SegLightshowTaskStk[TASK_STACKSIZE];
OS_STK    SSSRXTaskStk[TASK_STACKSIZE];
OS_STK    SSSTXTaskStk[TASK_STACKSIZE];
OS_STK    semaphore_task_stack[TASK_STACKSIZE];
OS_STK    semaphore_status_task_stack[TASK_STACKSIZE];

/* Global connection structure shared between RX and TX tasks */
static SSSConn g_conn;
OS_EVENT *g_conn_sem;  /* Semaphore for connection synchronization */

/* Global for status update socket */
static int g_status_socket = -1;
OS_EVENT *g_status_socket_sem;  /* Semaphore for status socket access */

/* Mailbox for semaphore state change notifications */
OS_EVENT *SemaphoreStatusMbox;

/*
 * Create our MicroC/OS-II resources. All of the resources beginning with
 * "SSS" are declared in this file, and created in this function.
 */
void SSSCreateOSDataStructs(void)
{
  INT8U error_code;

  /*
  * Create the resource for our MicroC/OS-II Queue for sending commands
  * received on the TCP/IP socket from the SSSSimpleSocketServerTask()
  * to the LEDManagementTask().
  */
  SSSLEDCommandQ = OSQCreate(&SSSLEDCommandQTbl[0], SSS_LED_COMMAND_Q_SIZE);
  if (!SSSLEDCommandQ)
  {
     alt_uCOSIIErrorHandler(EXPANDED_DIAGNOSIS_CODE,
     "Failed to create SSSLEDCommandQ.\n");
  }

 /* Create our MicroC/OS-II LED Lightshow Semaphore.  The semaphore is checked
  * by the SSSLEDLightshowTask each time it updates 7 segment LED displays,
  * U8 and U9.  The LEDTask grabs the semaphore away from the lightshow task to
  * toggle the lightshow off, and gives up the semaphore to turn the lightshow
  * back on.  The LEDTask does this in response to the CMD_LEDS_LIGHTSHOW
  * command sent from the SSSSimpleSocketServerTask when the user sends the
  * toggle lightshow command over the TCPIP socket.
  */
  SSSLEDLightshowSem = OSSemCreate(1);
  if (!SSSLEDLightshowSem)
  {
     alt_uCOSIIErrorHandler(EXPANDED_DIAGNOSIS_CODE,
                            "Failed to create SSSLEDLightshowSem.\n");
  }

 /*
  * Create our MicroC/OS-II LED Event Flag.  Each flag corresponds to one of
  * the LEDs on the Nios Development board, D0 - D7.
  */
  SSSLEDEventFlag = OSFlagCreate(0, &error_code);
  if (!SSSLEDEventFlag)
  {
     alt_uCOSIIErrorHandler(error_code, 0);
  }

  /* Create semaphore for connection synchronization between RX and TX tasks */
  g_conn_sem = OSSemCreate(1);
  if (!g_conn_sem)
  {
     alt_uCOSIIErrorHandler(EXPANDED_DIAGNOSIS_CODE,
                            "Failed to create g_conn_sem.\n");
  }

  /* Create semaphore for status socket access */
  g_status_socket_sem = OSSemCreate(1);
  if (!g_status_socket_sem)
  {
     alt_uCOSIIErrorHandler(EXPANDED_DIAGNOSIS_CODE,
                            "Failed to create g_status_socket_sem.\n");
  }

  /* Create mailbox for semaphore status updates */
  SemaphoreStatusMbox = OSMboxCreate(NULL);
  if (!SemaphoreStatusMbox)
  {
     alt_uCOSIIErrorHandler(EXPANDED_DIAGNOSIS_CODE,
                            "Failed to create SemaphoreStatusMbox.\n");
  }

  /* Initialize global connection structure */
  sss_reset_connection(&g_conn);
}

/* This function creates tasks used in this example which do not use sockets.
 * Tasks which use Interniche sockets must be created with TK_NEWTASK.
 */

void SSSCreateTasks(void)
{
   INT8U error_code;

   // RX and TX tasks are now created with TK_NEWTASK in iniche_init.c
   printf("Creating non-socket tasks...\n");

   error_code = OSTaskCreateExt((void (*)(void *))semaphore_task,
                             NULL,
                             (void *)&semaphore_task_stack[TASK_STACKSIZE-1],
                             SEMAPHORE_TASK_PRIORITY,
                             SEMAPHORE_TASK_PRIORITY,
                             semaphore_task_stack,
                             TASK_STACKSIZE,
                             NULL,
                             0);

   alt_uCOSIIErrorHandler(error_code, 0);

   printf("semaphore_task created.\n");

   /* Create semaphore status update task */
   error_code = OSTaskCreateExt((void (*)(void *))SemaphoreStatusTask,
                             NULL,
                             (void *)&semaphore_status_task_stack[TASK_STACKSIZE-1],
                             SEMAPHORE_STATUS_TASK_PRIORITY,
                             SEMAPHORE_STATUS_TASK_PRIORITY,
                             semaphore_status_task_stack,
                             TASK_STACKSIZE,
                             NULL,
                             0);

   alt_uCOSIIErrorHandler(error_code, 0);

   printf("semaphore_status_task created.\n");

#if 0  /* DISABLED: IRQs causing system freeze - using polling only */
#ifdef SEMAPHORE_HW_ENABLED
   /* Register interrupt handlers if hardware is enabled */
   register_semaphore_interrupts();
#endif
#endif
}


/*
 * sss_reset_connection()
 *
 * This routine will, when called, reset our SSSConn struct's members
 * to a reliable initial state. Note that we set our socket (FD) number to
 * -1 to easily determine whether the connection is in a "reset, ready to go"
 * state.
 */
void sss_reset_connection(SSSConn* conn)
{
  memset(conn, 0, sizeof(SSSConn));

  conn->fd = -1;
  conn->state = READY;
  conn->rx_wr_pos = conn->rx_buffer;
  conn->rx_rd_pos = conn->rx_buffer;
  return;
}

/*
 * sss_send_simple_response()
 *
 * This routine will transmit simple response out to the telnet client.
 */
void sss_send_simple_response(SSSConn* conn)
{
  alt_u8  tx_buf[SSS_TX_BUF_SIZE];
  alt_u8 *tx_wr_pos = tx_buf;

  const char *response_body = "<html><body><h1>Welcome to NIOS II Server</h1></body></html>";
  int content_length = strlen(response_body);

  tx_wr_pos += sprintf((char*)tx_wr_pos,
    "HTTP/1.1 200 OK\r\n"
    "Content-Type: text/html\r\n"
    "Content-Length: %d\r\n"
    "Access-Control-Allow-Origin: *\r\n"
    "Access-Control-Allow-Methods: POST, GET, OPTIONS\r\n"
    "Access-Control-Allow-Headers: Content-Type\r\n"
    "\r\n"
    "%s", content_length, response_body
);

  send(conn->fd, (char*)tx_buf, tx_wr_pos - tx_buf, 0);

  return;
}

/*
 * sss_handle_accept()
 *
 * This routine is called when ever our listening socket has an incoming
 * connection request. Since this example has only data transfer socket,
 * we just look at it to see whether its in use... if so, we accept the
 * connection request and call the telent_send_menu() routine to transmit
 * instructions to the user. Otherwise, the connection is already in use;
 * reject the incoming request by immediately closing the new socket.
 *
 * We'll also print out the client's IP address.
 */
void sss_handle_accept(int listen_socket, SSSConn* conn)
{
  int                 socket, len;
  struct sockaddr_in  incoming_addr;

  len = sizeof(incoming_addr);

  /* Allow replacing the existing connection to avoid stalls */
  if ((conn)->fd != -1)
  {
      /* If there's an active status socket, clear it too */
      if (g_status_socket == (conn)->fd) {
          g_status_socket = -1;
      }

      close((conn)->fd);
      sss_reset_connection(conn);
      printf("[sss_handle_accept] closing previous connection and accepting new one\n");
  }

  if((socket=accept(listen_socket,(struct sockaddr*)&incoming_addr,&len))<0)
  {
        alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,
                                        "[sss_handle_accept] accept failed");
  }
  else
  {
      (conn)->fd = socket;
      // sss_send_simple_response(conn);
      printf("[sss_handle_accept] accepted connection request from %s\n",
                inet_ntoa(incoming_addr.sin_addr));
  }

  return;
}

/*
 * send_semaphore_status()
 *
 * Sends the current semaphore status to the connected client via HTTP.
 * Format: "CC" where C is 'R', 'Y', or 'G' for each semaphore.
 */
void send_semaphore_status(void)
{
    INT8U tx_buf[256];
    INT8U *tx_wr_pos = tx_buf;
    char status_msg[3];
    INT8U error_code;
    semaphore_state_t state0, state1;
    uint16_t remaining0, remaining1;
    int bytes_sent;

    /* Get status from both semaphores */
    get_semaphore_status(0, &state0, &remaining0);
    get_semaphore_status(1, &state1, &remaining1);

    /* Convert states to characters */
    status_msg[0] = semaphore_state_to_string(state0);
    status_msg[1] = semaphore_state_to_string(state1);
    status_msg[2] = '\0';

    printf("[send_semaphore_status] Status: Sem0=%c(%ds), Sem1=%c(%ds)\n",
           status_msg[0], remaining0, status_msg[1], remaining1);

    /* Wait for socket semaphore */
    OSSemPend(g_status_socket_sem, 0, &error_code);

    if (g_status_socket >= 0) {
        /* Build HTTP response */
        tx_wr_pos += sprintf((char*)tx_wr_pos,
            "HTTP/1.1 200 OK\r\n"
            "Content-Type: text/plain; charset=ISO-8859-1\r\n"
            "Access-Control-Allow-Origin: *\r\n"
            "Content-Length: 2\r\n"
            "\r\n"
            "%s", status_msg);

        /* Send status */
        bytes_sent = send(g_status_socket, (char*)tx_buf, tx_wr_pos - tx_buf, 0);

        if (bytes_sent <= 0) {
            printf("[send_semaphore_status] Socket closed or error, resetting\n");
            g_status_socket = -1;
        } else {
            printf("[send_semaphore_status] Sent %d bytes: %s\n", bytes_sent, status_msg);
        }
    } else {
        printf("[send_semaphore_status] No active socket\n");
    }

    /* Release socket semaphore */
    OSSemPost(g_status_socket_sem);
}

/*
 * semaphore_interrupt_handler()
 *
 * Hardware interrupt handler called when semaphore changes state.
 * Posts a notification to the mailbox to trigger status update.
 */
#ifdef SEMAPHORE_HW_ENABLED
void semaphore_interrupt_handler(void* context)
{
    static INT32U notification = 1;
    static INT32U last_irq_tick = 0;
    INT32U current_tick;

    /* Clear interrupt source FIRST to prevent re-trigger */
    semaphore_hw_clear_irq(0);
    semaphore_hw_clear_irq(1);

    /* Debounce: ignore if IRQ came too quickly (< 200ms) */
    current_tick = OSTimeGet();
    if ((current_tick - last_irq_tick) < 20) {  /* 20 ticks = 200ms @ 1ms tick */
        return;
    }
    last_irq_tick = current_tick;

    /* Post notification (non-blocking, ignore error if full - will retry next IRQ) */
    OSMboxPost(SemaphoreStatusMbox, (void*)&notification);
}

/*
 * register_semaphore_interrupts()
 *
 * Registers interrupt handlers for both semaphores.
 */
void register_semaphore_interrupts(void)
{
    int result;

    #ifdef SEMAPHORE_0_IRQ
        result = alt_ic_isr_register(SEMAPHORE_0_IRQ_INTERRUPT_CONTROLLER_ID,
                                    SEMAPHORE_0_IRQ,
                                    semaphore_interrupt_handler,
                                    NULL,
                                    NULL);
        if (result == 0) {
            printf("[IRQ] Registered interrupt for Semaphore 0 (IRQ %d)\n", SEMAPHORE_0_IRQ);
            /* Enable hardware IRQ for semaphore 0 */
            // semaphore_hw_enable_irq(0);  /* DISABLED - causing freeze */
        } else {
            printf("[IRQ] Failed to register interrupt for Semaphore 0\n");
        }
        #else
        printf("[IRQ] SEMAPHORE_0_IRQ not defined, interrupts disabled\n");
    #endif

    #ifdef SEMAPHORE_1_IRQ
        result = alt_ic_isr_register(SEMAPHORE_1_IRQ_INTERRUPT_CONTROLLER_ID,
                                    SEMAPHORE_1_IRQ,
                                    semaphore_interrupt_handler,
                                    NULL,
                                    NULL);
        if (result == 0) {
            printf("[IRQ] Registered interrupt for Semaphore 1 (IRQ %d)\n", SEMAPHORE_1_IRQ);
            /* Enable hardware IRQ for semaphore 1 */
            // semaphore_hw_enable_irq(1);  /* DISABLED - causing freeze */
        } else {
            printf("[IRQ] Failed to register interrupt for Semaphore 1\n");
        }
    #endif
}
#endif /* SEMAPHORE_HW_ENABLED */

/*
 * SemaphoreStatusTask()
 *
 * Task that waits for status change notifications and sends updates to client.
 */
void SemaphoreStatusTask(void)
{
    INT8U error_code;
    void *msg;

    printf("[SemaphoreStatusTask] Started\n");

    while (1) {
        /* Wait for notification from interrupt or periodic update */
        msg = OSMboxPend(SemaphoreStatusMbox, 1000, &error_code);  /* 1 second timeout */

        if (error_code == OS_NO_ERR && msg != NULL) {
            /* Received notification from interrupt */
            printf("[SemaphoreStatusTask] State change notification received\n");
            send_semaphore_status();
        } else if (error_code == OS_TIMEOUT) {
            /* Periodic update (every second) */
            if (g_status_socket >= 0) {
                send_semaphore_status();
            }
        }
    }
}

/*
 * sss_exec_command()
 *
 * This routine is called whenever we have new, valid receive data from our
 * sss connection. It will parse through the data simply looking for valid
 * commands to the sss server.
 *
 * Incoming commands to talk to the board LEDs are handled by sending the
 * MicroC/OS-II SSSLedCommandQ a pointer to the value we received.
 *
 * If the user wishes to quit, we set the "close" member of our SSSConn
 * struct, which will be looked at back in sss_handle_receive() when it
 * comes time to see whether to close the connection or not.
 */
/**
 * @brief Parse semaphore configuration from protocol string "RRRYYYGGGRRRYYYGGGI"
 * @param data_start Pointer to start of data
 * @param content_length Length of data
 * @return 1 if successful, 0 if error
 */
static int parse_semaphore_config(const char *data_start, int content_length) {
    char config_str[24];
    int i;
    int red_time, yellow_time, green_time;
    char initial_state;

    /* Validate length: should be at least 19 characters (RRRYYYGGGRRRYYYGGGI) */
    if (content_length < 19) {
        printf("[parse_semaphore_config] Invalid data length: %d\n", content_length);
        return 0;
    }

    /* Copy and null-terminate */
    memset(config_str, 0, sizeof(config_str));
    for (i = 0; i < content_length && i < (int)sizeof(config_str) - 1; i++) {
        if (data_start[i] >= ' ' && data_start[i] <= '~') {
            config_str[i] = data_start[i];
        }
    }

    printf("[parse_semaphore_config] Received config: %.19s\n", config_str);

    /* Parse Semaphore 0: RRR YYY GGG */
    if (sscanf(config_str, "%3d%3d%3d", &red_time, &yellow_time, &green_time) != 3) {
        printf("[parse_semaphore_config] Failed to parse semaphore 0 times\n");
        return 0;
    }

    if (red_time < 0 || red_time > 999 || yellow_time < 0 || yellow_time > 999 ||
        green_time < 0 || green_time > 999) {
        printf("[parse_semaphore_config] Invalid time values: R=%d, Y=%d, G=%d\n",
               red_time, yellow_time, green_time);
        return 0;
    }

    printf("[parse_semaphore_config] Semaphore 0: R=%d, Y=%d, G=%d\n",
           red_time, yellow_time, green_time);

    set_semaphore_times(0, red_time, yellow_time, green_time);

    /* Parse Semaphore 1: RRR YYY GGG */
    if (sscanf(config_str + 9, "%3d%3d%3d", &red_time, &yellow_time, &green_time) != 3) {
        printf("[parse_semaphore_config] Failed to parse semaphore 1 times\n");
        return 0;
    }

    if (red_time < 0 || red_time > 999 || yellow_time < 0 || yellow_time > 999 ||
        green_time < 0 || green_time > 999) {
        printf("[parse_semaphore_config] Invalid time values for sem1: R=%d, Y=%d, G=%d\n",
               red_time, yellow_time, green_time);
        return 0;
    }

    printf("[parse_semaphore_config] Semaphore 1: R=%d, Y=%d, G=%d\n",
           red_time, yellow_time, green_time);

    /* Set configuration for semaphore 1 using new function */
    set_semaphore_times(1, red_time, yellow_time, green_time);

    /* Parse initial state for semaphore 0: I = R, Y, or G */
    initial_state = config_str[18];
    printf("[parse_semaphore_config] Initial state for semaphore 0: %c\n", initial_state);

    if (initial_state == 'R' || initial_state == 'Y' || initial_state == 'G') {
        semaphore_state_t initial = string_to_semaphore_state(initial_state);
        start_semaphore(0, initial);
    } else {
        printf("[parse_semaphore_config] Invalid initial state: %c\n", initial_state);
        return 0;
    }

    return 1;
}

void sss_exec_command(SSSConn* conn)
{
   INT8U tx_buf[SSS_TX_BUF_SIZE];
   INT8U *tx_wr_pos = tx_buf;
   char *body_start = NULL;
   char *content_length_str = NULL;
   int content_length = 0;
   char *data_start = NULL;
   const char *response_body = NULL;
   int response_len = 0;

   printf("[sss_exec_command] executing command on RX data\n");

   /* OPTIONS handling (CORS) */
   if (strstr((char*)conn->rx_buffer, "OPTIONS") == (char*)conn->rx_buffer) {
       tx_wr_pos += sprintf((char*)tx_wr_pos,
           "HTTP/1.1 204 No Content\r\n"
           "Access-Control-Allow-Origin: *\r\n"
           "Access-Control-Allow-Methods: POST, GET, OPTIONS\r\n"
           "Access-Control-Allow-Headers: Content-Type\r\n"
           "Content-Length: 0\r\n"
           "\r\n"
       );
       send(conn->fd, (char*)tx_buf, tx_wr_pos - tx_buf, 0);
       conn->close = 1;
       return;
   }

    /* GET /status - short polling (respond once, then close) */
    if (strstr((char*)conn->rx_buffer, "GET /status") != NULL) {
        semaphore_state_t s0, s1;
        uint16_t r0, r1;

        get_semaphore_status(0, &s0, &r0);
        get_semaphore_status(1, &s1, &r1);

        char body[4];
        body[0] = semaphore_state_to_string(s0);
        body[1] = semaphore_state_to_string(s1);
        body[2] = '\0';

        printf("[sss_exec_command] GET /status -> %c%c (%ds/%ds)\n", body[0], body[1], r0, r1);

        tx_wr_pos += sprintf((char*)tx_wr_pos,
             "HTTP/1.1 200 OK\r\n"
             "Content-Type: text/plain; charset=ISO-8859-1\r\n"
             "Access-Control-Allow-Origin: *\r\n"
             "Content-Length: 2\r\n"
             "Connection: close\r\n"
             "\r\n"
             "%s", body);

        send(conn->fd, (char*)tx_buf, tx_wr_pos - tx_buf, 0);
        conn->close = 1;
        return;
    }

    /* POST /process or /cmd - Semaphore configuration */
    if (strstr((char*)conn->rx_buffer, "POST /process") != NULL ||
         strstr((char*)conn->rx_buffer, "POST /cmd") != NULL) {
        printf("[sss_exec_command] processing POST /process|/cmd request\n");

      /* Encontrar Content-Length */
      content_length_str = strstr((char*)conn->rx_buffer, "Content-Length:");
      if (content_length_str) {
         content_length = atoi(content_length_str + 15);
      }

      /* Encontrar início do body */
      body_start = strstr((char*)conn->rx_buffer, "\r\n\r\n");
      if (body_start) {
         printf("[sss_exec_command] found body with length %d\n", content_length);
         body_start += 4;
         data_start = body_start;

         /* Parse semaphore configuration */
         if (parse_semaphore_config(data_start, content_length)) {
             response_body = "OK";
             response_len = 2;
             printf("[sss_exec_command] Configuration accepted\n");
         } else {
             response_body = "ERROR";
             response_len = 5;
             printf("[sss_exec_command] Configuration rejected\n");
         }

         /* Envia resposta HTTP */
         tx_wr_pos += sprintf((char*)tx_wr_pos,
             "HTTP/1.1 200 OK\r\n"
             "Content-Type: text/plain; charset=ISO-8859-1\r\n"
             "Access-Control-Allow-Origin: *\r\n"
             "Access-Control-Allow-Methods: POST, GET, OPTIONS\r\n"
             "Access-Control-Allow-Headers: Content-Type\r\n"
             "Content-Length: %d\r\n"
             "\r\n", response_len);
         memcpy(tx_wr_pos, response_body, response_len);
         tx_wr_pos += response_len;
      } else {
          printf("[sss_exec_command] no body found in POST /process request\n");
          tx_wr_pos += sprintf((char*)tx_wr_pos,
              "HTTP/1.1 400 Bad Request\r\n"
              "Content-Type: text/plain; charset=ISO-8859-1\r\n"
              "Access-Control-Allow-Origin: *\r\n"
              "Access-Control-Allow-Methods: POST, GET, OPTIONS\r\n"
              "Access-Control-Allow-Headers: Content-Type\r\n"
              "Content-Length: 12\r\n"
              "\r\n"
              "No body data");
      }
   } else {
      printf("[sss_exec_command] received non-POST /process request\n");
      tx_wr_pos += sprintf((char*)tx_wr_pos,
         "HTTP/1.1 404 Not Found\r\n"
         "Content-Type: text/plain; charset=ISO-8859-1\r\n"
         "Access-Control-Allow-Origin: *\r\n"
         "Access-Control-Allow-Methods: POST, GET, OPTIONS\r\n"
         "Access-Control-Allow-Headers: Content-Type\r\n"
         "Content-Length: 9\r\n"
         "\r\n"
         "Not found");
   }

   printf("[sss_exec_command] sending response\n");
   send(conn->fd, (char*)tx_buf, tx_wr_pos - tx_buf, 0);
   printf("[sss_exec_command] response sent\n");
   conn->close = 1;

   return;
}

/*
 * sss_handle_receive()
 *
 * This routine is called whenever there is a sss connection established and
 * the socket assocaited with that connection has incoming data. We will first
 * look for a newline "\n" character to see if the user has entered something
 * and pressed 'return'. If there is no newline in the buffer, we'll attempt
 * to receive data from the listening socket until there is.
 *
 * The connection will remain open until the user enters "Q\n" or "q\n", as
 * deterimined by repeatedly calling recv(), and once a newline is found,
 * calling sss_exec_command(), which will determine whether the quit
 * command was received.
 *
 * Finally, each time we receive data we must manage our receive-side buffer.
 * New data is received from the sss socket onto the head of the buffer,
 * and popped off from the beginning of the buffer with the
 * sss_exec_command() routine. Aside from these, we must move incoming
 * (un-processed) data to buffer start as appropriate and keep track of
 * associated pointers.
 */
void sss_handle_receive(SSSConn* conn)
{
  int data_used = 0, rx_code = 0;
  INT8U *header_end;

  conn->rx_rd_pos = conn->rx_buffer;
  conn->rx_wr_pos = conn->rx_buffer;

  printf("[sss_handle_receive] processing RX data\n");

  while(conn->state != CLOSE)
  {
    /* Find the end of HTTP headers (\r\n\r\n) */
    header_end = (INT8U*)strstr((char*)conn->rx_buffer, "\r\n\r\n");

    if(header_end)
    {
      printf("[sss_handle_receive] complete HTTP request received\n");
      /* HTTP request received, mark as complete for TX task to process */
      conn->state = COMPLETE;
      break;  /* Exit the loop, let TX task handle processing */
    }
    /* No complete headers received? Then ask the socket for data */
    else
    {
      printf("[sss_handle_receive] receiving data on socket\n");
      rx_code = recv(conn->fd, (char*)conn->rx_wr_pos,
        SSS_RX_BUF_SIZE - (conn->rx_wr_pos - conn->rx_buffer) -1, 0);

     if(rx_code > 0)
      {
        printf("[sss_handle_receive] received %d bytes\n", rx_code);
        conn->rx_wr_pos += rx_code;

        /* Zero terminate so we can use string functions */
        *(conn->rx_wr_pos+1) = 0;
      }
    }

    /*
     * When the request is processed, update our connection state so that
     * we can exit the while() loop and close the connection
     */
    if(conn->state != COMPLETE) {
      conn->state = conn->close ? CLOSE : READY;
    }

    /* Manage buffer */
    data_used = conn->rx_rd_pos - conn->rx_buffer;
    memmove(conn->rx_buffer, conn->rx_rd_pos,
       conn->rx_wr_pos - conn->rx_rd_pos);
    conn->rx_rd_pos = conn->rx_buffer;
    conn->rx_wr_pos -= data_used;
    memset(conn->rx_wr_pos, 0, data_used);
  }

  return;
}

/*
 * SSSSimpleSocketServerTask()
 *
 * This MicroC/OS-II thread spins forever after first establishing a listening
 * socket for our sss connection, binding it, and listening. Once setup,
 * it perpetually waits for incoming data to either the listening socket, or
 * (if a connection is active), the sss data socket. When data arrives,
 * the approrpriate routine is called to either accept/reject a connection
 * request, or process incoming data.
 */
void SSSSimpleSocketServerTask()
{
    short USAR_SERVER = 1;


    int fd_listen, max_socket;
    struct sockaddr_in addr;
    static SSSConn conn;
    fd_set readfds;

    struct sockaddr_in sa;
    int res;
    int SocketFD;
    char ip_str[16];

    if (USAR_SERVER == 0)
    {
        SocketFD = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
        if (SocketFD == -1) {
            perror("cannot create socket");
            exit(EXIT_FAILURE);
        }

        memset(&sa, 0, sizeof sa);

        sa.sin_family = AF_INET;
        sa.sin_port = htons(30);
        sprintf(ip_str, "%d.%d.%d.%d", GWADDR0, GWADDR1, GWADDR2, GWADDR3);
        res = inet_pton(AF_INET, ip_str, &sa.sin_addr);

        if (connect(SocketFD, (struct sockaddr *)&sa, sizeof sa) == -1) {
            perror("connect failed");
            close(SocketFD);
            exit(EXIT_FAILURE);
        }

        /* perform read write operations ... */
        while(1);

        shutdown(SocketFD, SHUT_RDWR);

        close(SocketFD);
        return;
    }
    /*
    * Sockets primer...
    * The socket() call creates an endpoint for TCP of UDP communication. It
    * returns a descriptor (similar to a file descriptor) that we call fd_listen,
    * or, "the socket we're listening on for connection requests" in our sss
    * server example.
    *
    * Traditionally, in the Sockets API, PF_INET and AF_INET is used for the
    * protocol and address families respectively. However, there is usually only
    * 1 address per protocol family. Thus PF_INET and AF_INET can be interchanged.
    * In the case of NicheStack, only the use of AF_INET is supported.
    * PF_INET is not supported in NicheStack.
    */
    if ((fd_listen = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,"[sss_task] Socket creation failed");
    }

    /*
    * Sockets primer, continued...
    * Calling bind() associates a socket created with socket() to a particular IP
    * port and incoming address. In this case we're binding to SSS_PORT and to
    * INADDR_ANY address (allowing anyone to connect to us. Bind may fail for
    * various reasons, but the most common is that some other socket is bound to
    * the port we're requesting.
    */
    addr.sin_family = AF_INET;
    addr.sin_port = htons(SSS_PORT);
    addr.sin_addr.s_addr = INADDR_ANY;

    if ((bind(fd_listen,(struct sockaddr *)&addr,sizeof(addr))) < 0)
    {
        alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,"[sss_task] Bind failed");
    }

    /*
    * Sockets primer, continued...
    * The listen socket is a socket which is waiting for incoming connections.
    * This call to listen will block (i.e. not return) until someone tries to
    * connect to this port.
    */
    if ((listen(fd_listen,1)) < 0)
    {
        alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,"[sss_task] Listen failed");
    }

    /* At this point we have successfully created a socket which is listening
    * on SSS_PORT for connection requests from any remote address.
    */
    sss_reset_connection(&conn);
    printf("[sss_task] Simple Socket Server listening on port %d\n", SSS_PORT);

    while(1)
    {
        /*
         * For those not familiar with sockets programming...
         * The select() call below basically tells the TCPIP stack to return
         * from this call when any of the events I have expressed an interest
         * in happen (it blocks until our call to select() is satisfied).
         *
         * In the call below we're only interested in either someone trying to
         * connect to us, or data being available to read on a socket, both of
         * these are a read event as far as select is called.
         *
         * The sockets we're interested in are passed in in the readfds
         * parameter, the format of the readfds is implementation dependant
         * Hence there are standard MACROs for setting/reading the values:
         *
         *   FD_ZERO  - Zero's out the sockets we're interested in
         *   FD_SET   - Adds a socket to those we're interested in
         *   FD_ISSET - Tests whether the chosen socket is set
         */
        FD_ZERO(&readfds);
        FD_SET(fd_listen, &readfds);
        max_socket = fd_listen+1;



        if (conn.fd != -1)
        {
            FD_SET(conn.fd, &readfds);
            if (max_socket <= conn.fd)
            {
                max_socket = conn.fd+1;
            }
        }

        select(max_socket, &readfds, NULL, NULL, NULL);

        /*
         * If fd_listen (the listening socket we originally created in this thread
         * is "set" in readfs, then we have an incoming connection request. We'll
         * call a routine to explicitly accept or deny the incoming connection
         * request (in this example, we accept a single connection and reject any
         * others that come in while the connection is open).
         */
        if (FD_ISSET(fd_listen, &readfds))
        {
          sss_handle_accept(fd_listen, &conn);
        }
        /*
         * If sss_handle_accept() accepts the connection, it creates *another*
         * socket for sending/receiving data over sss. Note that this socket is
         * independant of the listening socket we created above. This socket's
         * descriptor is stored in conn.fd. If conn.fs is set in readfs... we have
         * incoming data for our sss server, and we call our receiver routine
         * to process it.
         */
        else
        {
            if ((conn.fd != -1) && FD_ISSET(conn.fd, &readfds))
            {
                sss_handle_receive(&conn);
            }
        }
    } /* while(1) */
}

/*
 * SSSRXTask()
 *
 * This MicroC/OS-II thread handles incoming connections and data reception.
 * It accepts new connections and receives HTTP requests.
 */
void SSSRXTask()
{
    int fd_listen, max_socket;
    struct sockaddr_in addr;
    fd_set readfds;
    INT8U err;

    /*
    * Sockets primer...
    * The socket() call creates an endpoint for TCP of UDP communication. It
    * returns a descriptor (similar to a file descriptor) that we call fd_listen,
    * or, "the socket we're listening on for connection requests" in our sss
    * server example.
    */
    if ((fd_listen = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,"[sss_rx_task] Socket creation failed");
    }

    /*
    * Calling bind() associates a socket created with socket() to a particular IP
    * port and incoming address. In this case we're binding to SSS_PORT and to
    * INADDR_ANY address (allowing anyone to connect to us. Bind may fail for
    * various reasons, but the most common is that some other socket is bound to
    * the port we're requesting.
    */
    addr.sin_family = AF_INET;
    addr.sin_port = htons(SSS_PORT);
    addr.sin_addr.s_addr = INADDR_ANY;

    if ((bind(fd_listen, (struct sockaddr *)&addr, sizeof(addr))) < 0)
    {
        alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,"[sss_rx_task] Bind failed");
    }

    /*
    * The listen socket created by the call to socket() is only configured
    * to listen for TCP connection requests. Calling listen() tells the
    * TCPIP stack to start accepting connections on the socket.
    */
    if ((listen(fd_listen, 1)) < 0)
    {
        alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,"[sss_rx_task] Listen failed");
    }

    printf("[sss_rx_task] RX Task listening on port %d\n", SSS_PORT);

    while(1)
    {
        FD_ZERO(&readfds);
        FD_SET(fd_listen, &readfds);
        max_socket = fd_listen+1;

        /* Check if we have an active connection */
        OSSemPend(g_conn_sem, 0, (INT8U*)&err);
        if (g_conn.fd != -1)
        {
            FD_SET(g_conn.fd, &readfds);
            if (max_socket <= g_conn.fd)
            {
                max_socket = g_conn.fd+1;
            }
        }
        OSSemPost(g_conn_sem);

        select(max_socket, &readfds, NULL, NULL, NULL);

        /* Handle incoming connection requests */
        if (FD_ISSET(fd_listen, &readfds))
        {
            sss_handle_accept(fd_listen, &g_conn);
        }
        /* Handle incoming data */
        else
        {
            OSSemPend(g_conn_sem, 0, (INT8U*)&err);
            if ((g_conn.fd != -1) && FD_ISSET(g_conn.fd, &readfds))
            {
                sss_handle_receive(&g_conn);
            }
            OSSemPost(g_conn_sem);
        }
    } /* while(1) */
}

/*
 * SSSTXTask()
 *
 * This MicroC/OS-II thread handles data transmission.
 * It processes received HTTP requests and sends responses.
 */
void SSSTXTask()
{
    INT8U err;
    printf("[sss_tx_task] TX Task started\n");

    while(1)
    {
        /* Check if there's data to process and send */
        OSSemPend(g_conn_sem, 0, (INT8U*)&err);
        if (g_conn.state == COMPLETE)
        {
            sss_exec_command(&g_conn);
            if (g_conn.close)
            {
                close(g_conn.fd);
                sss_reset_connection(&g_conn);
            }
            else
            {
                g_conn.state = READY;
            }
        }
        OSSemPost(g_conn_sem);

        /* Sleep for a short time to prevent busy waiting */
        OSTimeDly(1);
    } /* while(1) */
}





/******************************************************************************
 *                                                                             *

/ *******************************************************************************
 *                                                                             *
 * License Agreement                                                           *
 *                                                                             *
 * Copyright (c) 2009 Altera Corporation, San Jose, California, USA.           *
 * All rights reserved.                                                        *
 *                                                                             *
 * Permission is hereby granted, free of charge, to any person obtaining a     *
 * copy of this software and associated documentation files (the "Software"),  *
 * to deal in the Software without restriction, including without limitation   *
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
 * and/or sell copies of the Software, and to permit persons to whom the       *
 * Software is furnished to do so, subject to the following conditions:        *
 *                                                                             *
 * The above copyright notice and this permission notice shall be included in  *
 * all copies or substantial portions of the Software.                         *
 *                                                                             *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
 * DEALINGS IN THE SOFTWARE.                                                   *
 *                                                                             *
 * This agreement shall be governed in all respects by the laws of the State   *
 * of California and by the laws of the United States of America.              *
 * Altera does not recommend, suggest or require that this reference design    *
 * file be used in conjunction or combination with any other product.          *
 ******************************************************************************/
