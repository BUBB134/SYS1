#initialise base address and offset
#loop through each value in the image
#   starting from the bottom right corner
#   split 16bit values into four nibbles
#   sub each nibble using the encryption table
#   combine back into the 16bit value
#   invert all the bits in the 16bit value
#   store the new value back into memory
#write a value to 0xfff to indicate the end of the image
#jump to an infinite loop

move rc 0x00
move rd 0x23
rol rd
rol rd
rol rd
rol rd
add rd 0x0f
jumpu main

main:
    move rc 0x00
    move rb rd
    add rb topLeft
    load ra (rb)
    move rb ra
    and rb 0x0f
    call encrypt
    xor rc 0xf
    rol ra
    rol ra
    rol ra
    rol ra
    move rb ra
    and rb 0x0f
    call encrypt
    xor rc 0xf
    rol ra
    rol ra
    rol ra
    rol ra
    move rb ra
    and rb 0x0f
    call encrypt
    xor rc 0xf
    rol ra
    rol ra
    rol ra
    rol ra
    move rb ra
    and rb 0x0f
    call encrypt
    xor rc 0xf
    move ra rc
    move rb rd
    add rb topLeft
    store ra (rb)
    and rd 0xff
    jumpz final_func
    sub rd 0x01
    jumpu main

final_func:
    move ra 0xff
    store ra to location 0xfff
    jumpu to inf_loop

inf_loop:
    jumpu to inf_loop

encrypt:
    and rb 0xff
    jumpz encrypt_0
    sub rb 0x01
    jumpz encrypt_1
    sub rb 0x01
    jumpz encrypt_2
    sub rb 0x01
    jumpz encrypt_3
    sub rb 0x01
    jumpz encrypt_4
    sub rb 0x01
    jumpz encrypt_5
    sub rb 0x01
    jumpz encrypt_6
    sub rb 0x01
    jumpz encrypt_7
    sub rb 0x01
    jumpz encrypt_8
    sub rb 0x01
    jumpz encrypt_9
    sub rb 0x01
    jumpz encrypt_a
    sub rb 0x01
    jumpz encrypt_b
    sub rb 0x01
    jumpz encrypt_c
    sub rb 0x01
    jumpz encrypt_d
    sub rb 0x01
    jumpz encrypt_e
    sub rb 0x01
    jumpz encrypt_f

encrypt_0:
    add rc 0xA
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_1:
    add rc 0x6
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_2:
    add rc 0xE
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_3:
    add rc 0x1
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_4:
    add rc 0x9
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_5:
    add rc 0x5
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_6:
    add rc 0xD
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_7:
    add rc 0x3
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_8:
    add rc 0xB
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_9:
    add rc 0x7
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_a:
    add rc 0xF
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_b:
    add rc 0x0
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_c:
    add rc 0x8
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_d:
    add rc 0x4
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_e:
    add rc 0xC
    rol rc
    rol rc
    rol rc
    rol rc
    ret
encrypt_f:
    add rc 0x2
    rol rc
    rol rc
    rol rc
    rol rc
    ret




topLeft:
    .data 0x400
