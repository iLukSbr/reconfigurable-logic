#!/usr/bin/env python3

def find_unbalanced_parens(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    lines = content.split('\n')
    open_count = 0
    close_count = 0
    
    for i, line in enumerate(lines, 1):
        open_in_line = line.count('(')
        close_in_line = line.count(')')
        
        print(f"Linha {i:3d}: +{open_in_line} -{close_in_line:2d} | {line.strip()}")
        
        open_count += open_in_line
        close_count += close_in_line
        
        if close_in_line > open_in_line + open_count:
            print(f"     ^ PROBLEMA: Fechamento inesperado na linha {i}")
    
    print(f"\nTotal: Abertos={open_count}, Fechados={close_count}")
    if open_count != close_count:
        print(f"Diferença: {close_count - open_count}")
    find_unbalanced_parens("DE2_NET/software/simple_socket/led.c")

if __name__ == "__main__":
    find_unbalanced_parens("led.c")