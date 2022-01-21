; Min Max Calculator
; Will Nigel De Jesus

; -----------Usage-------------
; nasm -f elf minmax.asm
; gcc minmax.o -o minmax -m32
; ./minmax

section .text
    extern printf
    extern scanf
    global main

main:
    push ebp
    mov ebp, esp

    ; Intro Message
    push in_msg
    call printf

    ; New Line
    push lin_brk
    call printf

    ; Please Enter 10 Numbers
    push msg_1
    call printf
    add esp, 4

loop_input:
    push ecx
    push curr
    push scn_int
    call scanf
    add esp, 8
    pop ecx
    mov eax, [curr]
    mov [arr + ecx * 4], eax

    inc ecx ; Loop Counter
    cmp ecx, [_arrlen] ; Check loop condition
    jl loop_input ; Loop if current iteration < array length

    ; Find Highest
    mov ebx, arr
    mov ecx, 0

    mov dword [top_id], ecx
    push dword [ebx]
    pop dword [top]

find_highest:
    push ecx
    mov eax, [ebx]
    cmp dword [top], eax
    jl swap_top

    swap_top_done:

    add ebx, 4
    pop ecx
    inc ecx
    cmp ecx, [_arrlen] ; Checks if program finished in iterating through all indexes of array
    jl find_highest


    ; Print Highest
    push dword [top_id]
    push dword [top]
    push msg_top
    call printf
    add esp, 12

    ; Find Lowest
    mov ebx, arr
    mov ecx, 0

    mov dword [bot_id], ecx
    push dword [ebx]
    pop dword [bot]

find_lowest:
    push ecx
    mov eax, [ebx]
    cmp dword [bot], eax
    jl swap_bot

    swap_bot_done:

    add ebx, 4
    pop ecx
    inc ecx
    cmp ecx, [_arrlen] ; Checks if program finished in iterating through all indexes of array
    jg find_lowest


    ; Print Highest
    push dword [bot_id]
    push dword [bot]
    push msg_bot
    call printf
    add esp, 12


exit:
    ; Exit
    mov eax, 1
    mov ebx, 0;
    int 0x80


swap_top:
    pop ecx
    mov dword [top_id], ecx
    push dword [ebx]
    pop dword [top]
    push ecx
    jmp swap_top_done

swap_bot:
    pop ecx
    mov dword [bot_id], ecx
    push dword [ebx]
    pop dword [bot]
    push ecx
    jmp swap_bot_done


section .data
    ; --- Messages ---
    in_msg  :   db  "Min Max Calculator", 10, 0

    ; Prompts
    msg_1   :   db  "Please Enter 10 Numbers: ", 10, 0
    msg_2   :   db  "Enter a number: ", 10, 0

    ; Labels
    msg_top :   db  "Highest Number: %d [%d]", 10, 0
    msg_bot :   db  "Lowest Number: %d [%d]", 10, 0

    ; Utils
    prt_int :   db  "%d", 10, 0
    prt_rem :   db  "%d r. %d", 10, 0
    scn_int :   db  "%d", 0
    lin_brk :   db  "", 10, 0

    ; Vars
    arr times 10 dd 0
    _arr :
        dd 10
		dd 99
		dd 19
		dd 31
		dd 87
		dd 9
		dd 2
		dd 999
		dd 6
		dd 142
    _arrlen dd 10

section .bss
    top     resd    1
    top_id  resd    1
    bot     resd    1
    bot_id  resd    1
    curr    resd    1