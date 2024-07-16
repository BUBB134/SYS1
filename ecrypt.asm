#set RD to 1024
#set RC to 576
#nibble1:
#	RB = 4
#	TMP = 0
#	RA = pixel at RD
#	mask of lower nibble
#	encrypt nibble
#nibble2:
#	RB = 3
#invert RA
#	RA = RA + TMP
#	shift RA 4 bits left
#	TMP = RA
#	RA = pixel at RD
#	shift nibble 2 to end
#	mask off lower nibble
#	encrypt nibble
#nibble3:
#	RB = 2
#	invert RA
#	RA = RA + TMP
#	shift RA 4 bits left
#	TMP = RA
#	RA = pixel at RD
#	shift nibble 3 to end
#	mask off lower nibble
#	encrypt nibble
#nibble4:
#	RB = 1
#	invert RA
#	RA = RA + TMP
#	shift RA 4 bits left
#	TMP = RA
#	RA = pixel at RD
#	shift nibble 4 to end
#	mask off lower nibble
#	encrypt nibble
#encrypt#
#	encrypt nibble
#	check_nib
#checknib:
#	if rb = 4:
#		nibble2
#	...
#	if rb = 1:
#		increment
#increment:
#	RD + 1
#	RC - 1
#	if rc = 0:
#		finish and create output
#	else:
#		nibble1

start:
    move rd 0x40
    rol rd
    rol rd
    rol rd
    rol rd
    move ra 0x24
    rol ra
    rol ra
    rol ra
    rol ra
    store ra count
    move rb 0xf
	call nibble1
    
nibble1:
    move ra 0x0
    load ra (rd)
    and ra 0xf
    call encrypt
    jump nibble2
    

nibble2:
	xor ra rb
    add rc ra
    rol rc
    rol rc
    rol rc
    rol rc
    load ra (rd)
    rol ra
    rol ra
    rol ra
    rol ra
    and ra 0xf
    call encrypt
    jump nibble3
nibble3:
    xor ra rb
    add rc ra
    rol rc
    rol rc
    rol rc
    rol rc
    load ra (rd)
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    and ra 0xf
    call encrypt
    jump nibble4

nibble4:
    xor ra rb
    add rc ra
    rol rc
    rol rc
    rol rc
    rol rc
    load ra (rd)
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    rol ra
    and ra 0xf
    call encrypt
    jump increment

encrypt:
    add ra 0x01
    sub ra 0x01
    jumpz encrypt_0
    sub ra 0x01
    jumpz encrypt_1
    sub ra 0x01
    jumpz encrypt_2
    sub ra 0x01
    jumpz encrypt_3
    sub ra 0x01
    jumpz encrypt_4
    sub ra 0x01
    jumpz encrypt_5
    sub ra 0x01
    jumpz encrypt_6
    sub ra 0x01
    jumpz encrypt_7
    sub ra 0x01
    jumpz encrypt_8
    sub ra 0x01
    jumpz encrypt_9
    sub ra 0x01
    jumpz encrypt_a
    sub ra 0x01
    jumpz encrypt_b
    sub ra 0x01
    jumpz encrypt_c
    sub ra 0x01
    jumpz encrypt_d
    sub ra 0x01
    jumpz encrypt_e
    sub ra 0x01
    jumpz encrypt_f

increment:
	xor ra rb
    add rc ra
    rol rc
    rol rc
    rol rc
    rol rc
    store ra (rd)
    add rd 0x1
    load ra count
    sub ra 0x1
    jumpz final
    store ra count
    jump nibble1

final:
    move ra 0xff
    store ra 0xfff
    jump infinite_loop

infinite_loop:
    jump infinite_loop


encrypt_0:
    move ra 0xA
    ret
encrypt_1:
    move ra 0x6
    ret
encrypt_2:
    move ra 0xE
    ret
encrypt_3:
    move ra 0x1
    ret
encrypt_4:
    move ra 0x9
    ret
encrypt_5:
    move ra 0x5
    ret
encrypt_6:
    move ra 0xD
    ret
encrypt_7:
    move ra 0x3
    ret
encrypt_8:
    move ra 0xB
    ret
encrypt_9:
    move ra 0x7
    ret
encrypt_a:
    move ra 0xF
    ret
encrypt_b:
    move ra 0x0
    ret
encrypt_c:
    move ra 0x8
    ret
encrypt_d:
    move ra 0x4
    ret
encrypt_e:
    move ra 0xC
    ret
encrypt_f:
    move ra 0x2
    ret
	
count:
	.data 0x00