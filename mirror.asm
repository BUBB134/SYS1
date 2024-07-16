move ra 0    #immediate addressing
and ra 0x00	 #immediate addressing
add ra 0x40   #immediate addressing
rol ra	 #register addressing
rol ra   #register addressing
rol ra   #register addressing
rol ra   #register addressing
move rc ra  #register addressing
move rd ra  #register addressing
add rd 0x17  #immediate addressing
jumpu row_function

row_function:
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	
	jumpu increment_row #direct addressing

swap_function:
	load ra (rd)
	move ra rb
	load ra (rc)
	xor ra rb
	xor rb ra
	xor ra rb
	store ra (rc)
	move rb ra
	store ra (rd)
	add rc 0x01 #immediate addressing
	sub rd 0x01 #immediate addressing
	ret #direct addressing
	
increment_row:
	add rc 0x0C #immediate addressing
	move rc rd #register addressing
	move ra 0x62 #immediate addressing
	rol ra
	rol ra
	rol ra
	rol ra
	add ra 0x08
	sub rd ra
	jumpz finish
	move rc ra
	add rd 0x17 #immediate addressing
	jumpu row_function #direct addressing
	
finish:
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	call swap_function #direct addressing
	move ra 0xff #immediate addressing
	store ra 0xfff #absolute addressing
	jumpu infinite_loop #direct addressing

infinite_loop:
	jump infinite_loop #direct addressing

