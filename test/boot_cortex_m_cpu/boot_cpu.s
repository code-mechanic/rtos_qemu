.section .vectors
vector_table:
    .word 0xABCO
    .word reset_handler
    .zero 400

    .section .text
    .align 1
    .type reset_handler, %function

reset_handler:
    mov r1, #0x1
    mov r2, #0x2
    add r3, r1, r2
    bl.
