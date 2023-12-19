section .data
    cmdline db 'background.exe', 0

section .text
    global _start

_start:
    ; Call ShellExecuteA to open background.exe
    ; You might need to link with user32.lib

    ; Load ShellExecuteA parameters
    ; Parameters: (HWND hwnd, LPCSTR lpOperation, LPCSTR lpFile, LPCSTR lpParameters, LPCSTR lpDirectory, INT nShowCmd)

    ; Set hwnd to 0 (NULL)
    xor ecx, ecx

    ; Set lpOperation to NULL ("open")
    xor edx, edx

    ; Load lpFile with the address of the string 'background.exe'
    lea ebx, [cmdline]

    ; Set lpParameters to NULL
    xor esi, esi

    ; Set lpDirectory to NULL
    xor edi, edi

    ; Set nShowCmd to SW_SHOWNORMAL
    mov eax, 1

    ; Call ShellExecuteA
    call ShellExecuteA

    ; Exit the program
    mov eax, 1
    int 0x80

section .data
    ShellExecuteA db 'ShellExecuteA', 0

section .text
    ShellExecuteA:
        ; Parameters: (HWND hwnd, LPCSTR lpOperation, LPCSTR lpFile, LPCSTR lpParameters, LPCSTR lpDirectory, INT nShowCmd)

        ; Load ShellExecuteA address
        push ebx
        push esi
        push edi
        push edx
        push ecx
        mov eax, [esp + 20] ; Get address of ShellExecuteA from the import address table
        call eax           ; Call ShellExecuteA
        add esp, 20        ; Clean up the stack
        ret
