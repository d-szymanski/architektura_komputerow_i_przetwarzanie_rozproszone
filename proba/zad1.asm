; <r>ax pierwszy operator
; <r>dx drugi operator

; nawiasy sa dla zmiennych !! nie rejestrow - debilu

section .data
        tab1    dq      40, 871, 181, 157, 268, 790, 310, 211
        file    db      "zaliczenie.txt"

section .bss
        tab2    resq    8 		; tablica pomocnicza
        tabw    resb    6 		; tablica wynikowa

section .text
        global _start

_start:
        mov ecx, 8 			; iterator petli: nasze "i"
        mov rsi, 0 			; drugi iterator

_saveToStackMinusTen:
        sub qword[tab1 + rsi * 8], 10 	; odjecie od tablicy wskaznik przesuniecia o 8
        mov rax, qword[tab1 + rsi * 8]	; zapisanie tymczasowe warosci do rejestru (rax.. bo byl wolny)
        push rax			; push na STOS - STOS JEST ABSTRAKCYJNY! scope chyba na caly program
        inc rsi				; inkrementacja bo przechodzimy do kolejnego elementu tablicy
        loop _saveToStackMinusTen 	; pod spodem jest decrementacja <e>cx(iteratora) i porownanie do 0
					; jesli jest wiekszy od o to zapetla, inaczej idzie dalej

; tab1 = [30, 861, 171, 147, 278, 780, 300, 201]
; stos wyglad podobnie.. na spodzie jest 30, na wierzchu jest 201.

_beforeRead:
        mov ecx, 8			; nasz kochany iterator dosteje 8
        mov rsi, 0			; iterator numer 2
	mov rbx, 3			; dzielnik do <r>bx (przez co dzielimy)

_readFromStackAndDivide:
        mov rdx, 0			; zabezpieczenie dzielenia
        pop rax				; pop ze STOSU na rax - pierwszy operator mnozenia i dzielena
        div rbx				; dzielenie <r>ax (pierwszy operator) przez <r>bx (zawsze rejest)
        mov qword[tab2 + rsi * 8], rax	; wrzucamy do tablicy pomocniczej na piersze miejsce
        inc rsi				; inkrementacja
        loop _readFromStackAndDivide	; decrementacja ecx, porownanie do 0

_beforeSizeChange:
        mov ecx, 8			; iterator "i"
        mov rsi, 0			; iterator numer 2
        mov rdi, 0			; iterator numer 3 - do write to tabW

_sizeChangeAndCheck:
        mov rax, qword[tab2 + rsi * 8]	; biere sobie element tablicy
        cmp rax, 255			; COMPERE - pierwszy musi byc rejestr - zapisuje efekt porownania
        jbe _writeToTabw		; jbe - _jump_ (if) _below_ _equal_ do zapisu (else let it go...)
_continueSizeChangeAndCheck:
        inc rsi				; zwieksz iterator w pointerze
        loop _sizeChangeAndCheck

_writeFile:
        mov rax, 2			; rax - tam zapisujemy rodzaje polecen - 2 open
        mov rdi, file			; "const char *filename" - byte bo "db"
        mov rsi, 65			; 65 - bo O_CREATE + O_WRONLY => 64 + 1 = 65
	syscall				; do <r>ax zostaje zapisany file descriptor
	mov rbx, rax			; zapisujemy go do rbx (zapmaietujemy)

        mov rax, 1			; 1 zapis
        mov rdi, rbx			; dodajemy file desriptor do <r>di
        mov rsi, tabw			; zapisujemy bitowo tablice wynikową - bo "db"
        mov rdx, 6			; wilkosc tablicy do zapisu (w bajtach)
	syscall

	mov rax, 3
	mov rdi, rbx
	syscall

_end:
        mov rax, 60
        mov rdi, 0
        syscall

_writeToTabw:
        mov byte[tabw + rdi], al	; zapisz do tabwynikowej 8-bitowej
					; "al" - pierwsza czastka(8bitowa) <r>ax
        inc rdi				; zwiekszamy iterator na wskazniku zapisowym
        jmp _continueSizeChangeAndCheck

