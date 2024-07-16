ra = current pixel
rb = single nibble being encrypted
rc = storage of encrypted pixel
rd = counter from 575 , to get pointer just add 1024 and work in reverse from 1599
to 1024, means when counter is 0 perform the functions once more


main:
    move 0x0 to rc
    move rb 0x40
    rb rol rol rol rol
    add rd to rb (to get pointer)
    load from location rb to ra
    move ra to rb
    mask off right most nibble using and 0xf on rb
    call encrypt
    xor rc with 0xf to invert
    ra rol rol rol rol
    move ra to rb
    mask off right most nibble using and 0xf on rb
    call encrypt
    xor rc with 0xf to invert
    ra rol rol rol rol
    move ra to rb
    mask off right most nibble using and 0xf on rb
    call encrypt
    xor rc with 0xf to invert
    ra rol rol rol rol
    move ra to rb
    mask off right most nibble using and 0xf on rb
    call encrypt
    xor rc with 0xf to invert
    move rc to ra
    move rb 0x40
    rb rol rol rol rol
    add rd to rb (to get pointer)
    store ra to location (rb)
    sub 1 from rd
    jumpz to final_func
    jumpu to main


encrypt:
    if rb 0 then:
    add rc 0x____
    rol, rol, rol, rol
    sub 1 (1)
    if rb 0 then:
    sub rc 0x____
    add rc 0x____
    rol, rol, rol, rol
    sub 1 (2)
    ...
    sub 1 (16)
    if rb 0 then:
    sub rc 0x____
    add rc 0x____
    rol, rol, rol, rol
    ret

final_func:
    move 0x0 to rc
    move rb 0x40
    rb rol rol rol rol
    add rd to rb (to get pointer)
    load from location rb to ra
    move ra to rb
    mask off right most nibble using and 0xf on rb
    call encrypt
    xor rc with 0xf to invert
    ra rol rol rol rol
    move ra to rb
    mask off right most nibble using and 0xf on rb
    call encrypt
    xor rc with 0xf to invert
    ra rol rol rol rol
    move ra to rb
    mask off right most nibble using and 0xf on rb
    call encrypt
    xor rc with 0xf to invert
    ra rol rol rol rol
    move ra to rb
    mask off right most nibble using and 0xf on rb
    call encrypt
    xor rc with 0xf to invert
    move rc to ra
    move rb 0x40
    rb rol rol rol rol
    store ra to location (rb)
    move ra 0xff
    store ra to location 0xfff
    jumpu to inf_loop

inf_loop:
    jumpu to inf_loop