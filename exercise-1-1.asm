bits 16
org 0x7C00

	cli
     
mov ah ,0x02
mov al ,8
mov dl ,0x80
mov dh ,0
mov ch ,0
mov cl ,2
mov bx ,on
int 0x13
jmp on

 
  times (510 - ($ - $$)) db 0
db 0x55, 0xAA

 
  on: 
     cli
	xor ax,ax
	mov ss,ax
	mov sp,0xffff
	;
	
	;WRITE YOUR CODE HERE
       ; first column
        xor ecx,ecx
        mov edi, 0xB8004
        add edi,0x32 
        inc edi
        a:
        mov al,0xFF
        mov [edi],al
        add edi,0xA0 ;160
       inc ecx
        cmp ecx,24
       jl a
       
       ;second column
	xor ecx,ecx
       mov edi, 0xB8004
        add edi,0x64
        inc edi
        b:
        mov al,0xFF
        mov [edi],al
        add edi,0xA0 ;160
       inc ecx
       cmp ecx,24
       jl b
       
       ;first row
       xor ecx,ecx
       mov edi, 0xB8004
       add edi,0x460
       inc edi 
        c:
        mov al,0xFF
        mov [edi],al
        add edi,2 ;160
       inc ecx
       cmp ecx,75
       jl c
       ;second row
         xor ecx,ecx
       mov edi, 0xB8004
       add edi,0x960
       inc edi
        d:
        mov al,0xFF
        mov [edi],al
        add edi,2 ;160
       inc ecx
       cmp ecx,75
       jl d
       mov ebp,0
       jmp check
       
       first:
   
        mov ecx,0
        cmp byte[arr+ecx],'0'
        jne check
        mov byte[arr+ecx],'1'
       
         
         mov edi, 0xB8012
         inc ebp
         push ebp
         test ebp,0x01
         jz even
         jnz odd
         
         second:
        mov ecx,1
         cmp byte[arr+ecx],'0'
        jne check
        mov byte[arr+ecx],'1'
         
         
          mov edi, 0xB8044
         inc ebp 
        push ebp
         test ebp,0x01
         jz even
         jnz odd
         
         third:
         
        mov ecx,2
         cmp byte[arr+ecx],'0'
        jne check
        mov byte[arr+ecx],'1'
         
       
           mov edi, 0xB8076
         inc ebp 
        push ebp
         test ebp,0x01
         jz even
         jnz odd
         
      fourth:
       
        mov ecx,3
         cmp byte[arr+ecx],'0'
        jne check
        mov byte[arr+ecx],'1'
      
      
           mov edi, 0xB8512
         inc ebp 
       push ebp
         test ebp,0x01
         jz even
         jnz odd
         
         fifth:
         
       
        mov ecx,4
         cmp byte[arr+ecx],'0'
        jne check
        mov byte[arr+ecx],'1'
        
         
           mov edi, 0xB8544
         inc ebp 
       push ebp
         test ebp,0x01
         jz even
         jnz odd
         
         six:
         
        mov ecx,5
         cmp byte[arr+ecx],'0'
        jne check
        mov byte[arr+ecx],'1'
        
         
           mov edi, 0xB8576
         inc ebp
       push ebp
        test ebp,0x01
         jz even
         jnz odd
         
         seven:
         
        mov ecx,6
         cmp byte[arr+ecx],'0'
        jne check
        mov byte[arr+ecx],'1'
        
         
           mov edi, 0xB8A12
         inc ebp
        push ebp
         test ebp,0x01
         jz even
         jnz odd
         
         eight:
         
        mov ecx,7
         cmp byte[arr+ecx],'0'
        jne check
        mov byte[arr+ecx],'1'
         
         
           mov edi, 0xB8A44
         inc ebp
        push ebp 
         test ebp,0x01
         jz even
         jnz odd
         
         nine:
         
        mov ecx,8
         cmp byte[arr+ecx],'0'
        jne check
        mov byte[arr+ecx],'1'
        
         
           mov edi, 0xB8A76
         inc ebp
        push ebp
         test ebp,0x01
         jz even
         jnz odd
         
         odd:
       
         jmp drawx
       
       
         
         even:
          
         jmp drawo
        
        
         
         next:
         
         row1:
         cmp byte[arr2],'X'
         jne row2
         cmp byte[arr2+1],'X'
         jne row2
         cmp byte[arr2+2],'X'
         jne row2
         mov byte[win],'X'
         jmp winrow1
         
         row2:
         cmp byte[arr2+3],'X'
         jne row3
         cmp byte[arr2+4],'X'
         jne row3
         cmp byte[arr2+5],'X'
         jne row3
          mov byte[win],'X'
         jmp winrow2
         
          row3:
         cmp byte[arr2+6],'X'
         jne column1
         cmp byte[arr2+7],'X'
         jne column1
         cmp byte[arr2+8],'X'
         jne column1
         jmp winrow3
         
           column1:
         cmp byte[arr2],'X'
         jne column2
         cmp byte[arr2+3],'X'
         jne column2
         cmp byte[arr2+6],'X'
         jne column2
          mov byte[win],'X'
         jmp wincolumn1
         
           column2:
         cmp byte[arr2+1],'X'
         jne column3
         cmp byte[arr2+4],'X'
         jne column3
         cmp byte[arr2+7],'X'
         jne column3
          mov byte[win],'X'
         jmp wincolumn2
         
           column3:
         cmp byte[arr2+2],'X'
         jne diag1
         cmp byte[arr2+5],'X'
         jne diag1
         cmp byte[arr2+8],'X'
         jne diag1
          mov byte[win],'X'
         jmp wincolumn3
         
         diag1:
         cmp byte[arr2],'X'
         jne diag2
         cmp byte[arr2+4],'X'
         jne diag2
         cmp byte[arr2+8],'X'
         jne diag2
          mov byte[win],'X'
         jmp windiag1
         
          diag2:
         cmp byte[arr2+2],'X'
         jne row11
         cmp byte[arr2+4],'X'
         jne row11
         cmp byte[arr2+6],'X'
         jne row11
          mov byte[win],'X'
         jmp windiag2
         
         row11:
         cmp byte[arr2],'O'
         jne row22
         cmp byte[arr2+1],'O'
         jne row22
         cmp byte[arr2+2],'O'
         jne row22
          mov byte[win],'O'
         jmp winrow1
         
         row22:
         cmp byte[arr2+3],'O'
         jne row33
         cmp byte[arr2+4],'O'
         jne row33
         cmp byte[arr2+5],'O'
         jne row33
         mov byte[win],'O'
         jmp winrow2
         
          row33:
         cmp byte[arr2+6],'O'
         jne column11
         cmp byte[arr2+7],'O'
         jne column11
         cmp byte[arr2+8],'O'
         jne column11
         mov byte[win],'O'
         jmp winrow3
         
           column11:
         cmp byte[arr2],'O'
         jne column22
         cmp byte[arr2+3],'O'
         jne column22
         cmp byte[arr2+6],'O'
         jne column22
         mov byte[win],'O'
         jmp wincolumn1
         
           column22:
         cmp byte[arr2+1],'O'
         jne column33
         cmp byte[arr2+4],'O'
         jne column33
         cmp byte[arr2+7],'O'
         jne column33
         mov byte[win],'O'
         jmp wincolumn2
         
           column33:
         cmp byte[arr2+2],'O'
         jne diag11
         cmp byte[arr2+5],'O'
         jne diag11
         cmp byte[arr2+8],'O'
         jne diag11
         mov byte[win],'O'
         jmp wincolumn3
         
         diag11:
         cmp byte[arr2],'O'
         jne diag22
         cmp byte[arr2+4],'O'
         jne diag22
         cmp byte[arr2+8],'O'
         jne diag22
         mov byte[win],'O'
         jmp windiag1
         
          diag22:
         cmp byte[arr2+2],'O'
         jne R
         cmp byte[arr2+4],'O'
         jne R
         cmp byte[arr2+6],'O'
         jne R
         mov byte[win],'O'
         jmp windiag2
         
         
         
         
         
         
      
      R:
      
        pop ebp
         cmp ebp,9
        
         jge nowin
         
         
          check:
          
         in al,0x64
         and al,0x01
         jz check
         in al,0x60
         cmp al,0x80
         ja check
         cmp al,0x47  ;7
         je first
         cmp al,0x48 ;8
         je second
         cmp al,0x49  ;9
         je third
         cmp al,0x4b   ;4
         je fourth
         cmp al,0x4c   ;5
         je fifth
         cmp al,0x4d   ;6
         je six
         cmp al,0x4f   ;1
         je seven
         cmp al,0x50   ;2
         je eight
         cmp al,0x51   ;3
         je nine
      jmp check
      
       ;drawing x
       drawx:
       mov byte[arr2+ecx],'X'
       push edi
      xor ecx,ecx
      xor ebx,ebx
      inc edi
         add ebx,0xA0
         add ebx,2
         
        e:
         
         mov al,0x40
         mov [edi],al
         
         add edi,ebx
         inc ecx
         cmp ecx,7
         jl e
         
         xor ecx,ecx
         xor ebx,ebx
         pop edi
         inc edi
         
         add edi,0x0C
         add ebx,0xA0
         sub ebx,2
         
        f:
         
         mov al,0x40
         mov [edi],al
         add edi,ebx
         inc ecx
         cmp ecx,7
         jl f
       
         jmp next
         
         drawo:
         ;drawing o
         mov byte[arr2+ecx],'O'
         push edi
         xor ecx,ecx
         xor ebx,ebx
         add edi, 0x06
         add edi,0xA0
         inc edi
         add ebx,0xA0
         sub ebx,2
         mov esi,4
         xor edx,edx
         mov edx,2
         
        g:
        push edi
         mov al,0x1F
         mov [edi],al
         add edi,edx
         add edx,esi
         mov [edi],al
         pop edi
         add edi,ebx
         inc ecx
         cmp ecx,3
         jl g
         
         pop edi
         xor ecx,ecx
         xor ebx,ebx
         add edi,0x3AE
         add edi,0x18
         inc edi
         add ebx,0xA0
         add ebx,2
         mov esi,4
         xor edx,edx
         mov edx,2
         
        h:
        push edi
         mov al,0x1F
         mov [edi],al
         add edi,edx
         add edx,esi
         mov [edi],al
         pop edi
         sub edi,ebx
         inc ecx
         cmp ecx,3
         jl h
         
       
         jmp next
            
          winrow1:
          
       xor ecx,ecx
       mov edi, 0xB8004
       add edi,0x1E0
       inc edi 
        s:
        mov al,0x60
        mov [edi],al
        add edi,2 ;160
       inc ecx
       cmp ecx,75
       jl s
       jmp kl
       cmp byte[win],'X'
       je drawxwin
       jne drawowin
       

winrow2:
       xor ecx,ecx
       mov edi, 0xB8004
       add edi,0x6E0
       inc edi
       t:
       mov al,0x60
       mov [edi],al
       add edi,2 ;160
       inc ecx
       cmp ecx,75
       jl t
       jmp kl
         cmp byte[win],'X'
       je drawxwin
       jne drawowin
       
winrow3:
       xor ecx,ecx
       mov edi, 0xB8004
       add edi,0xBE0
       inc edi
       u:
       mov al,0x60
       mov [edi],al
       add edi,2 ;160
       inc ecx
       cmp ecx,75
       jl u
jmp kl
wincolumn1:
        xor ecx,ecx
        mov edi, 0xB8000
        add edi,0x18
        inc edi
        v:
        mov al,0x60
        mov [edi],al
        add edi,0xA0 ;160
       inc ecx
        cmp ecx,24
       jl v
       jmp kl
       cmp byte[win],'X'
       je drawxwin
       jne drawowin
       
       wincolumn2:
        xor ecx,ecx
        mov edi, 0xB8000
        add edi,0x4A
        inc edi
        w:
        mov al,0x60
        mov [edi],al
        add edi,0xA0 ;160
       inc ecx
        cmp ecx,24
       jl w
       jmp kl
       cmp byte[win],'X'
       je drawxwin
       jne drawowin

 wincolumn3:
        xor ecx,ecx
        mov edi, 0xB8000
        add edi,0x7C
        inc edi
        x:
        mov al,0x60
        mov [edi],al
        add edi,0xA0 ;160
       inc ecx
        cmp ecx,24
       jl x
       jmp kl
       cmp byte[win],'X'
       je drawxwin
       jne drawowin
       
       windiag1:
     ;  mov edi,0xB8536
;       
;       xor ecx,ecx
;      xor ebx,ebx
;      inc edi
;         add ebx,0xA0
;         add ebx,2
;         
;        ee:
;         
;         mov al,0x60
;         mov [edi],al
;         
;         add edi,ebx
;         inc ecx
;         cmp ecx,25
;         jl ee
       jmp kl
       cmp byte[win],'X'
       je drawxwin
       jne drawowin
       
        windiag2:
        drawxwin:
        
        
        drawowin:
        nowin:
       
       
       
        
        
        

arr: db '0','0','0','0','0','0','0','0','0'
arr2: db '0','0','0','0','0','0','0','0','0'
win: db '0'
   kl:     

times (0x400000 - 512) db 0

db 	0x63, 0x6F, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x78, 0x00, 0x00, 0x00, 0x02
db	0x00, 0x01, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
db	0x20, 0x72, 0x5D, 0x33, 0x76, 0x62, 0x6F, 0x78, 0x00, 0x05, 0x00, 0x00
db	0x57, 0x69, 0x32, 0x6B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x78, 0x04, 0x11
db	0x00, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0xE6, 0xB9, 0x49, 0x44, 0x4E, 0x1C
db	0x50, 0xC9, 0xBD, 0x45, 0x83, 0xC5, 0xCE, 0xC1, 0xB7, 0x2A, 0xE0, 0xF2
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00