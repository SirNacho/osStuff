print:
  pusha

start:
  mov al, [bx] ; 'bx' is the base address for the string
  cmp al, 0
  je done

  mov ah, 0x0e ; the part where we print with the BIOS help
  int 0x10 ; 'al' already contains a char

  add bx, 1; increment pointer and do next loop
  jmp start

done:
  popa
  ret

print_nl:
  pusha

  mov ah, 0x0e
  mov al, 0x0a ; newline char
  int 0x10
  mov al, 0x0d ; carriage return
  int 0x10

  popa
  ret
