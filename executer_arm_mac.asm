.data
    cmdline:    .asciz  "background.app"

.text
    .global _start

_start:
    ; Call open system call to open background.app
    mov x0, x1, #0      ; File path (background.app)
    mov x1, #0          ; Flags (O_RDONLY, read-only)
    mov x2, #0          ; Mode (not applicable for O_RDONLY)
    mov x8, #56         ; System call number for openat (0x38)
    svc #0              ; Trigger the system call

    ; Check if the open call was successful
    cmp x0, #0
    blt exit_program    ; If open failed, exit the program

    ; File descriptor is in x0, close it (optional, depending on your use case)
    mov x8, #57         ; System call number for close (0x39)
    mov x0, x0          ; File descriptor
    svc #0              ; Trigger the system call

    ; Exit the program
    mov x8, #1          ; System call number for exit (0x1)
    mov x0, #0          ; Exit status
    svc #0              ; Trigger the system call

exit_program:
    ; Exit the program with an error status
    mov x8, #1          ; System call number for exit (0x1)
    mov x0, #1          ; Exit status indicating an error
    svc #0              ; Trigger the system call
