.text
.globl _start

_start:
    addi x1, x0, 0      # counter = 0
    addi x2, x0, 5      # limit = 5

loop:
    addi x1, x1, 1      # counter++
    blt  x1, x2, loop  # branch taken until x1 == 5

end:
    nop