.syntax unified
.cpu cortex-m3
.thumb

.global Reset_Handler
.global Default_Handler

.section .isr_vector, "a"
.align 2
.word _stack_end
.word Reset_Handler
.word Default_Handler
.word Default_Handler
.word Default_Handler
.word Default_Handler
.word Default_Handler
.word 0
.word 0
.word 0
.word 0
.word Default_Handler
.word Default_Handler
.word 0
.word Default_Handler
.word Default_Handler

.section .text.Reset_Handler, "ax"
.thumb_func
Reset_Handler:
    ldr sp, =_stack_end
    bl main
    b .

.section .text.Default_Handler, "ax"
.thumb_func
Default_Handler:
    b .