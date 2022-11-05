	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_FindDrive
_FindDrive:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-8
	add	r6
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 112
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_fat32
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 116
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 116
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 116
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 116
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 116
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l6
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 119
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 120
						//pcreltotemp
	.lipcrel	l3
	add	r7
						// freereg r1
						// freereg r2
						// freereg r3
l6: # 

						//../DeMiSTify/firmware/minfat.c, line 124
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 125
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)store type 3
	st	r6
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 128
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_FAT16_ID
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 128
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 54)
	.liabs	_sector_buffer, 54
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 128
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 128
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 128
						//call
						//pcreltotemp
	.lipcrel	___strncmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 128
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 128
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l8
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 129
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done
						// freereg r1
						// freereg r2
						// freereg r3
l8: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 130
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// extern
	.liabs	_FAT32_ID
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 130
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 82)
	.liabs	_sector_buffer, 82
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 130
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 130
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 130
						//call
						//pcreltotemp
	.lipcrel	___strncmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 130
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 130
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l10
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 131
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done
l10: # 

						//../DeMiSTify/firmware/minfat.c, line 135
						// (test)
						// (obj to tmp) flags 62 type 3
						// deref 
	ld	r6

						//../DeMiSTify/firmware/minfat.c, line 135
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l19
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 141
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 98
						// extern
	.liabs	_sector_buffer, 454
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 142
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 2 type 102
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 510
						//extern deref
						//sizemod based on type 0x102
	hlf
	ldt
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 142
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 3
						// matchobj comparing flags 98 with 2
						// deref 
	//nop
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	21930
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 142
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l14
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 143
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 454
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 144
						//pcreltotemp
	.lipcrel	l17
	add	r7
l14: # 

						//../DeMiSTify/firmware/minfat.c, line 144
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 3
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	43605
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 144
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l17
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 147
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 148
						//pcreltotemp
	.lipcrel	l3
	add	r7
						// freereg r1
l17: # 

						//../DeMiSTify/firmware/minfat.c, line 150
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 150
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 150
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 150
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 150
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l19
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 151
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 153
						//pcreltotemp
	.lipcrel	l3
	add	r7
						// freereg r1
						// freereg r2
						// freereg r3
l19: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 158
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// extern
	.liabs	_FAT32_ID
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 158
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 82)
	.liabs	_sector_buffer, 82
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 158
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 158
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 158
						//call
						//pcreltotemp
	.lipcrel	___strncmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 158
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 158
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 159
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_fat32
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 160
						//pcreltotemp
	.lipcrel	l24
	add	r7
						// freereg r1
						// freereg r2
						// freereg r3
l21: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 160
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// extern
	.liabs	_FAT16_ID
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 160
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 54)
	.liabs	_sector_buffer, 54
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 160
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 160
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 160
						//call
						//pcreltotemp
	.lipcrel	___strncmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 160
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 160
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l24
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 163
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 164
						//pcreltotemp
	.lipcrel	l3
	add	r7
						// freereg r1
l24: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 166
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 510
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 166
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	85
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 166
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l25
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 166
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 511
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 166
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	170
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 166
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l26
		add	r7
l25: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 167
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 170
						//pcreltotemp
	.lipcrel	l3
	add	r7
l26: # 

						//../DeMiSTify/firmware/minfat.c, line 170
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_sector_buffer
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 170
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 3
						// matchobj comparing flags 98 with 2
						// deref 
	//nop
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	233
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 170
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l29
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 170
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 3
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	235
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 170
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l29
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 171
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 174
						//pcreltotemp
	.lipcrel	l3
	add	r7
						// freereg r1
l29: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 174
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 11
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 174
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	//mt
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 174
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l31
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 174
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sector_buffer, 12
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 174
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 174
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l32
		add	r7
l31: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 175
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 178
						//pcreltotemp
	.lipcrel	l3
	add	r7
						// freereg r1
						// freereg r2
l32: # 

						//../DeMiSTify/firmware/minfat.c, line 178
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 13
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_cluster_size, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 181
						// (bitwise/arithmetic) 	//ops: 5, 0, 1
						// (obj to r0) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	//mt
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_cluster_mask, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 186
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 14
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 186
						// (bitwise/arithmetic) 	//ops: 2, 6, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	mt	r5
	add	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 186
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 66
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 15
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 186
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 186
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						//Special case - addt
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)store type 3
	st	r6
						//save_temp done
						// matchobj comparing flags 98 with 98
						// Obsoleting t1
						// freereg r2
						// freereg r1
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 98
						// extern (offset 0)
	.liabs	_fat_start
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 130
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r6
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 187
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 2 type 101
						// matchobj comparing flags 2 with 98
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_sector_buffer, 16
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/minfat.c, line 189
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 189
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l35
		add	r7
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 191
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_FAT32_ID
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 191
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// extern (offset 82)
	.liabs	_sector_buffer, 82
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 191
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 191
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 2
	.liconst	8
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 191
						//call
						//pcreltotemp
	.lipcrel	___strncmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 191
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 191
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l37
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 192
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 194
						//pcreltotemp
	.lipcrel	l3
	add	r7
						// freereg r1
						// freereg r2
						// freereg r3
l37: # 
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 195
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_root_directory_size, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r4
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 196
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 37
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 196
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 196
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 36
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 196
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	//mt
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 196
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sector_buffer, 38
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 196
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 196
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 196
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sector_buffer, 39
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 196
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	24
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 196
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 197
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 197
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_fat_start
						//extern deref
						//sizemod based on type 0x103
	ldt
	add	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_data_start, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r1
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 198
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 45
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 198
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r2
						// (save result) // isreg
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 198
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 44
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 198
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r3 - only match against tmp
	//mt
	addt	r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r3
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 198
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sector_buffer, 46
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 198
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	shl	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 198
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r3 - only match against tmp
	mt	r3
	addt	r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r3
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 198
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sector_buffer, 47
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 198
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	15
	and	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 198
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	24
	shl	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 198
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r3 - only match against tmp
	mt	r3
	addt	r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r3
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_root_directory_cluster, 4
						// extern pe not varadr
						//sizemod based on type 0x3
	stmpdec	r2

						//../DeMiSTify/firmware/minfat.c, line 199
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	2
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 199
						// (bitwise/arithmetic) 	//ops: 3, 5, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 199
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						//Special case - addt
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_root_directory_start
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 202
						//pcreltotemp
	.lipcrel	l38
	add	r7
l35: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 204
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 18
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 204
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 204
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 17
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 204
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	//mt
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 205
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	5
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 205
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	511
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 205
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	9
	shr	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_root_directory_size, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r1
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 208
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_sector_buffer, 23
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 208
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r2
						// (save result) // isreg
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 208
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 22
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 208
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r3 - only match against tmp
	//mt
	addt	r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r3

						//../DeMiSTify/firmware/minfat.c, line 211
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 211
						// (bitwise/arithmetic) 	//ops: 3, 7, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 62 type 103
						// deref 
	ld	r6
	add	r2
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_root_directory_start, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r2

						//../DeMiSTify/firmware/minfat.c, line 212
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_root_directory_cluster
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 215
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_data_start
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1
						// freereg r2
						// freereg r1
l38: # 
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 219
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_current_directory_cluster
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_root_directory_cluster
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 220
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_current_directory_start
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_root_directory_start
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 221
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 221
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l40
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 221
						// (bitwise/arithmetic) 	//ops: 5, 0, 1
						// (obj to r0) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	4
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x6a
	mt	r0
	st	r6

						//../DeMiSTify/firmware/minfat.c, line 221
						//pcreltotemp
	.lipcrel	l41
	add	r7
l40: # 

						//../DeMiSTify/firmware/minfat.c, line 221
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// extern
	.liabs	_root_directory_size
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x6a
	mt	r0
	st	r6
l41: # 

						//../DeMiSTify/firmware/minfat.c, line 221
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_dir_entries
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 130
						// matchobj comparing flags 106 with 130
						// deref 
	ld	r6
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 223
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 130
	.liconst	1
	mr	r0
l3: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-8
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_GetCluster
_GetCluster:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 103
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 231
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 64
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 231
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l45
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 233
						// (bitwise/arithmetic) 	//ops: 3, 0, 4
						// (obj to r3) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r2 - only match against tmp
	mt	r2
	mr	r3
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	7
	shr	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 234
						// (bitwise/arithmetic) 	//ops: 3, 0, 6
						// (obj to r5) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r5
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	127
	and	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 237
						//pcreltotemp
	.lipcrel	l46
	add	r7
l45: # 

						//../DeMiSTify/firmware/minfat.c, line 238
						// (bitwise/arithmetic) 	//ops: 3, 0, 4
						// (obj to r3) flags 42 type 103
						// reg r2 - only match against tmp
	mt	r2
	mr	r3
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shr	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 239
						// (bitwise/arithmetic) 	//ops: 3, 0, 6
						// (obj to r5) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r5
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r5
						// (save result) // isreg
l46: # 

						//../DeMiSTify/firmware/minfat.c, line 242
						// (bitwise/arithmetic) 	//ops: 0, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_fat_start
						//extern deref
						//sizemod based on type 0x103
	ldt
	add	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 243
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_cachedsector
						//extern deref
						//sizemod based on type 0x103
	ldt
	cmp	r3

						//../DeMiSTify/firmware/minfat.c, line 243
	cond	EQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l50
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 245
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_cachedsector, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r3

						//../DeMiSTify/firmware/minfat.c, line 246
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 246
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 246
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 246
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 246
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l50
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 247
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 248
						//pcreltotemp
	.lipcrel	l42
	add	r7
l50: # 

						//../DeMiSTify/firmware/minfat.c, line 250
						// (test)
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 250
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l52
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 250
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 250
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 250
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 6a type 103
						// matchobj comparing flags 106 with 130
						// deref 
	ld	r1
	mr	r4
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	268435455
	and	r4
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 250
						//pcreltotemp
	.lipcrel	l53
	add	r7
l52: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 250
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 103
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	2
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 250
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 250
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r4)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 6a type 102
						// matchobj comparing flags 106 with 130
						// deref 
	hlf
	ld	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
l53: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 251
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
l42: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_FileOpen
_FileOpen:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-16
	add	r6
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
						//sizemod based on type 0xa
	stmpdec	r1
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 260
						// (test)
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0xa
	ldidx	r6

						//../DeMiSTify/firmware/minfat.c, line 260
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 261
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 263
						//pcreltotemp
	.lipcrel	l54
	add	r7
l57: # 

						//../DeMiSTify/firmware/minfat.c, line 263
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0xa
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	8
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching

						//../DeMiSTify/firmware/minfat.c, line 263
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 162 with 98
						// deref
						// var FIXME - deref?
						// reg - auto
	//nop
	mr	r0
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 266
						// (test)
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	32
	ldidx	r6

						//../DeMiSTify/firmware/minfat.c, line 266
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l58
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 266
						// (test)
						// (obj to tmp) flags 22 type 301
						// matchobj comparing flags 34 with 2
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 2
	.liconst	32
	ldidx	r6
						//sizemod based on type 0x301
	byt
	ldt

						//../DeMiSTify/firmware/minfat.c, line 266
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l59
		add	r7
l58: # 

						//../DeMiSTify/firmware/minfat.c, line 267
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 269
						//pcreltotemp
	.lipcrel	l54
	add	r7
						// freereg r1
l59: # 

						//../DeMiSTify/firmware/minfat.c, line 269
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type a
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 269
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 269
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 269
						//call
						//pcreltotemp
	.lipcrel	_NextDirEntry
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 269
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/minfat.c, line 269
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r4 - only match against tmp
				// flags 42
	and	r4

						//../DeMiSTify/firmware/minfat.c, line 269
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l85
		add	r7
						// freereg r2
l83: # 
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 272
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_longfilename
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 272
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	32
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 272
						//call
						//pcreltotemp
	.lipcrel	___strcasecmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 272
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 272
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l85
		add	r7
						// freereg r3
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 275
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 74
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 275
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	32
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 275
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	11
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 275
						//call
						//pcreltotemp
	.lipcrel	___strncasecmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 275
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 275
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l85
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 269
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/minfat.c, line 269
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/minfat.c, line 269
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l71
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 269
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 269
						//pcreltotemp
	.lipcrel	l72
	add	r7
l71: # 

						//../DeMiSTify/firmware/minfat.c, line 269
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
l72: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 269
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 269
						//call
						//pcreltotemp
	.lipcrel	_NextDirEntry
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 269
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/minfat.c, line 269
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r4 - only match against tmp
				// flags 42
	and	r4

						//../DeMiSTify/firmware/minfat.c, line 269
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l83
		add	r7
						// freereg r2
l85: # 
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 279
						// (test)
						// (obj to tmp) flags 42 type a
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/minfat.c, line 279
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l75
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 281
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	28
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 281
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 162 with 74
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
	mr	r0
						// (obj to tmp) flags 6a type 103
						// deref 
	ld	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 282
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	26
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 282
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	8
						//sizemod based on type 0xa
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching

						//../DeMiSTify/firmware/minfat.c, line 282
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 6a type 102
						// matchobj comparing flags 106 with 130
						// deref 
	hlf
	ld	r1
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x22
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 106
						// matchobj comparing flags 162 with 106
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	4
	ldidx	r6
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 283
						// (test)
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 283
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l77
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 283
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	20
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 283
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 102
						// matchobj comparing flags 106 with 74
						// deref 
	hlf
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 283
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	4095
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 283
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	16
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 283
						//pcreltotemp
	.lipcrel	l78
	add	r7
l77: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 283
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l78: # 

						//../DeMiSTify/firmware/minfat.c, line 283
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 22 type 103
						// matchobj comparing flags 34 with 2
						// matchobj comparing flags 34 with 2
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 2
						// matchobj comparing flags 162 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	ldidx	r6
						//sizemod based on type 0x103
	ldt
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x22
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 34
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 34
	.liconst	4
	ldidx	r6
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness

						//../DeMiSTify/firmware/minfat.c, line 284
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// var FIXME - deref?
						// reg - auto
	.liconst	8
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 285
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
						//sizemod based on type 0xa
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	12
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 285
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 22 type 103
						// matchobj comparing flags 34 with 1
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 1
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 1
	.liconst	4
	ldidx	r6
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 286
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 34
						// var, auto|reg
						// matchobj comparing flags 1 with 34
	.liconst	8
						//sizemod based on type 0xa
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 286
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 289
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r2
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 102 type a
						// matchobj comparing flags 258 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0xa
	ldidx	r6
						// (save temp)isreg
	mr	r4
						//save_temp done
l79: # 
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 291
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type a
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0xa
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	20
	add	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 291
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 291
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 291
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 3
	stinc	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 292
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r4
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 290
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 290
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	6
	sgn
	cmp	r5

						//../DeMiSTify/firmware/minfat.c, line 290
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l79
		add	r7
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 294
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 22 type 103
						// matchobj comparing flags 34 with 1
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 1
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x103
	ldt
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	9
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 294
						//Call division routine
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	48
	mr	r2
	.lipcrel	_div_u32byu32
	add	r7
	mt	r0
	mr	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 294
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0xa
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	68
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 294
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 297
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 298
						//pcreltotemp
	.lipcrel	l54
	add	r7
l75: # 
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 300
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0
l54: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-16
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3
	.global	_FileNextSector
_FileNextSector:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r4
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r5
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 102 type 3
						// matchobj comparing flags 258 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	16
	ldidx	r6
						// (save temp)isreg
	mr	r5
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 308
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 258
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/minfat.c, line 308
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l87
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 308
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 308
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 308
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l87
		add	r7
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 106
						// deref 
	ld	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 310
						// (bitwise/arithmetic) 	//ops: 6, 2, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 98
						// reg r1 - only match against tmp
	//mt
	add	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 311
						// (bitwise/arithmetic) 	//ops: 6, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 74
						// reg r5 - only match against tmp
	mt	r5
	xor	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 311
						//comp
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_cluster_mask
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r2
						// matchobj comparing flags 1 with 2
	.liconst	-1
	xor	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 311
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	and	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 311
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 311
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l96
		add	r7
l95: # 
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 313
						// (bitwise/arithmetic) 	//ops: 5, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	4
	addt	r4
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 313
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 313
						//call
						//pcreltotemp
	.lipcrel	_GetCluster
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 313
						// Z disposable
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x6a
	mt	r0
	st	r3
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 314
						// (bitwise/arithmetic) 	//ops: 0, 5, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 106
						// matchobj comparing flags 2 with 106
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r1
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 2
						// matchobj comparing flags 98 with 106
						// deref 
	ld	r4
	add	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 98
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 311
						// (bitwise/arithmetic) 	//ops: 6, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 74
						// matchobj comparing flags 66 with 106
						// reg r5 - only match against tmp
	mt	r5
	xor	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 311
						//comp
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// matchobj comparing flags 2 with 106
						// extern
	.liabs	_cluster_mask
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r2
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 106
	.liconst	-1
	xor	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 311
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	mt	r2
	and	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 311
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 311
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l95
		add	r7
l96: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 316
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)store type 3
	st	r4
						//save_temp done
l87: # 
						// freereg r1
						// freereg r4
						// freereg r5
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.4
	.global	_FileReadSector
_FileReadSector:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 324
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
				// flags 42
	and	r3

						//../DeMiSTify/firmware/minfat.c, line 324
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l99
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 324
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 324
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 324
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l100
		add	r7
l99: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 325
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 327
						//pcreltotemp
	.lipcrel	l104
	add	r7
						// freereg r1
l100: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 327
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_data_start
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 328
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 328
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to r2) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	2
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 328
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 328
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 103
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 329
						// (bitwise/arithmetic) 	//ops: 0, 4, 3
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_cluster_mask
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r2
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r3
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 329
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 98
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 330
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_cachedsector, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r1

						//../DeMiSTify/firmware/minfat.c, line 331
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	8
	ldidx	r6
	stdec	r6

						//../DeMiSTify/firmware/minfat.c, line 331
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 331
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 331
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 331
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l103
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 332
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 333
						//pcreltotemp
	.lipcrel	l104
	add	r7
l103: # 

						//../DeMiSTify/firmware/minfat.c, line 334
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	1
	mr	r0
l104: # 
						// freereg r1
						// freereg r3
	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.5
	.global	_FileWriteSector
_FileWriteSector:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 342
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
				// flags 42
	and	r3

						//../DeMiSTify/firmware/minfat.c, line 342
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 342
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 342
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 342
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l108
		add	r7
l107: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 343
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 345
						//pcreltotemp
	.lipcrel	l112
	add	r7
						// freereg r1
l108: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 345
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_data_start
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 346
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 346
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to r2) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	2
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 346
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 346
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 103
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 347
						// (bitwise/arithmetic) 	//ops: 0, 4, 3
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_cluster_mask
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r2
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r3
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 347
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 98
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 348
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_cachedsector, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r1

						//../DeMiSTify/firmware/minfat.c, line 349
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	8
	ldidx	r6
	stdec	r6

						//../DeMiSTify/firmware/minfat.c, line 349
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 349
						//call
						//pcreltotemp
	.lipcrel	_sd_write_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 349
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 349
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l111
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 350
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 351
						//pcreltotemp
	.lipcrel	l112
	add	r7
l111: # 

						//../DeMiSTify/firmware/minfat.c, line 352
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	1
	mr	r0
l112: # 
						// freereg r1
						// freereg r3
	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.6
	.global	_DumpBookmarks
_DumpBookmarks:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r4
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 360
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 64
						// reg r4 - only match against tmp
	//mt
				// flags 42
	and	r4

						//../DeMiSTify/firmware/minfat.c, line 360
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l124
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 360
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 360
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 360
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l124
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 362
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done
l123: # 
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 364
						// (bitwise/arithmetic) 	//ops: 5, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	20
	addt	r4
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 364
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 364
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 364
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 364
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
	stdec	r6
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 364
						// Q1 disposable
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 106
						// deref 
	ld	r1
	stdec	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 364
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 106
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//../DeMiSTify/firmware/minfat.c, line 364
						// (a/p push)
						// a: pushed 12, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l122,0
						// static pe is varadr
	stdec	r6

						//../DeMiSTify/firmware/minfat.c, line 364
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 16 + 0 bytes
	.liconst	16
	add	r6

						//../DeMiSTify/firmware/minfat.c, line 363
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 363
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	6
	sgn
	cmp	r3

						//../DeMiSTify/firmware/minfat.c, line 363
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l123
		add	r7
l124: # 
						// freereg r3
						// freereg r4
	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.rodata.7
	.align	4
l122:
	.byte	40
	.byte	66
	.byte	111
	.byte	111
	.byte	107
	.byte	109
	.byte	97
	.byte	114
	.byte	107
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	37
	.byte	120
	.byte	44
	.byte	32
	.byte	37
	.byte	120
	.byte	41
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.8
	.global	_BestBookmark
_BestBookmark:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-8
	add	r6
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 40 type a
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type a
	st	r6
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 373
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	-1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 374
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 4003
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	2147483647
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 375
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done
l134: # 
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 377
						// (bitwise/arithmetic) 	//ops: 7, 0, 3
						// (obj to r2) flags 62 type a
						// deref 
	ld	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	20
	add	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 377
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 377
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 377
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 5
						// (obj to r4) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	24
	ldidx	r6
	mr	r4
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 2
						// deref 
	ld	r1
	sub	r4
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 378
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	0
	sgn
	cmp	r4

						//../DeMiSTify/firmware/minfat.c, line 378
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l132
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 378
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	sgn
	cmp	r4

						//../DeMiSTify/firmware/minfat.c, line 378
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l132
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 380
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	8
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r3

						//../DeMiSTify/firmware/minfat.c, line 381
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 42 type 4003
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r5
						//save_temp done
l132: # 

						//../DeMiSTify/firmware/minfat.c, line 376
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 376
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	6
	sgn
	cmp	r3

						//../DeMiSTify/firmware/minfat.c, line 376
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l134
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 384
						//setreturn
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// freereg r3
						// freereg r4
						// freereg r5
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	-8
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.9
	.global	_WorstBookmark
_WorstBookmark:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-16
	add	r6
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 40 type a
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type a
	st	r6
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4

						//../DeMiSTify/firmware/minfat.c, line 392
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	2147483647
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 393
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 8, 0 with 4, 0
						//Fuzzy match found, offset: 4 (varadr: 1)
	.liconst	4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	-1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 394
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done
l149: # 

						//../DeMiSTify/firmware/minfat.c, line 396
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
l150: # 
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 398
						// (bitwise/arithmetic) 	//ops: 7, 0, 4
						// (obj to r3) flags 62 type a
						// deref 
	ld	r6
	mr	r3
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	20
	add	r3
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 398
						// (bitwise/arithmetic) 	//ops: 5, 0, 3
						// (obj to r2) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 398
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type a
						// reg r3 - only match against tmp
	mt	r3
	addt	r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 398
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 398
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// reg r3 - only match against tmp
	mt	r3
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r3

						//../DeMiSTify/firmware/minfat.c, line 398
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
	mr	r0
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 106
						// matchobj comparing flags 106 with 106
						// deref 
	ld	r1
	sub	r0
						// (save result) // isreg
	mt	r0
	mr	r1
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 398
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	16
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 399
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	cmp	r5

						//../DeMiSTify/firmware/minfat.c, line 399
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l147
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 399
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 399
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l147
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 401
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r4

						//../DeMiSTify/firmware/minfat.c, line 402
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
						// (save temp)store type 3
	st	r0
						//save_temp done
l147: # 

						//../DeMiSTify/firmware/minfat.c, line 397
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 397
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	6
	sgn
	cmp	r4

						//../DeMiSTify/firmware/minfat.c, line 397
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l150
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 395
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 395
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	6
	sgn
	cmp	r5

						//../DeMiSTify/firmware/minfat.c, line 395
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l149
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 406
						//setreturn
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// freereg r4
						// freereg r5
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	-16
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.a
	.global	_FileSeek
_FileSeek:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-20
	add	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 412
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	36
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	9
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/minfat.c, line 413
						//comp
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_cluster_mask
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r2
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	-1
	xor	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 413
						// (bitwise/arithmetic) 	//ops: 3, 0, 1
						// (obj to r0) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 2
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/minfat.c, line 418
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
				// flags 42
	and	r3

						//../DeMiSTify/firmware/minfat.c, line 418
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l153
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 418
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done
						// matchobj comparing flags 74 with 74
						// Obsoleting t1

						//../DeMiSTify/firmware/minfat.c, line 418
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 418
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l153
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 421
						// (bitwise/arithmetic) 	//ops: 3, 4, 1
						// (obj to r0) flags 42 type 103
						// matchobj comparing flags 66 with 106
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 66
						// matchobj comparing flags 98 with 66
						// deref 
	ld	r3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 98
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/minfat.c, line 422
						// (bitwise/arithmetic) 	//ops: 4, 0, 5
						//Special case - addt
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r3
						// (save temp)isreg
	mr	r4
						//save_temp done
						// matchobj comparing flags 66 with 66
						// Obsoleting t1

						//../DeMiSTify/firmware/minfat.c, line 422
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 66
						// deref 
	ld	r4
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 424
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 98
						// var, auto|reg
						// matchobj comparing flags 1 with 98
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 424
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l159
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 426
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 429
						//pcreltotemp
	.lipcrel	l160
	add	r7
						// freereg r1
l159: # 

						//../DeMiSTify/firmware/minfat.c, line 431
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 103
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 431
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 431
						//call
						//pcreltotemp
	.lipcrel	_BestBookmark
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 431
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5

						//../DeMiSTify/firmware/minfat.c, line 432
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
	sgn
	cmp	r5

						//../DeMiSTify/firmware/minfat.c, line 432
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l162
		add	r7
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 435
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 435
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 435
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 435
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ldinc	r1
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 436
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 106
						// deref 
	ld	r1
						// (save temp)store type 3
	st	r4
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 439
						//pcreltotemp
	.lipcrel	l163
	add	r7
l162: # 
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 441
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 442
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 442
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r1
						// (save temp)store type 3
	st	r4
						//save_temp done
						// freereg r1
l163: # 

						//../DeMiSTify/firmware/minfat.c, line 446
						// (bitwise/arithmetic) 	//ops: 0, 4, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 2
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r3
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 98
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/minfat.c, line 448
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	16
						//sizemod based on type 0x103
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 448
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 448
						//call
						//pcreltotemp
	.lipcrel	_BestBookmark
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 2
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 448
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 452
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	68
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 452
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 130
						// matchobj comparing flags 106 with 130
						// deref 
	ld	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 452
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 106
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 452
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l165
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 452
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r5

						//../DeMiSTify/firmware/minfat.c, line 452
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l165
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 452
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	20
	addt	r3
						// (save temp)store type a
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 452
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 452
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 452
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 2
						// matchobj comparing flags 106 with 2
						// deref 
	ld	r1
	sub	r0
						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/minfat.c, line 452
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 452
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l165
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 454
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 454
						//call
						//pcreltotemp
	.lipcrel	_WorstBookmark
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 454
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/minfat.c, line 455
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 455
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 455
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
						//sizemod based on type 0x103
	ldidx	r6
						// (save temp)store type 3
	stinc	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 456
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1
l165: # 

						//../DeMiSTify/firmware/minfat.c, line 460
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 460
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 460
						//call
						//pcreltotemp
	.lipcrel	_FileNextSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l160: # 

						//../DeMiSTify/firmware/minfat.c, line 462
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 462
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 462
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 463
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 463
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	36
	ldidx	r6
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1
l153: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-20
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.b
	.global	_FileRead
_FileRead:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-16
	add	r6
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r6
						//sizemod based on type 0xa
	stmpdec	r1
						// freereg r1
						// allocreg r5
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 102 type a
						// var, auto|reg
	.liconst	32
	ldidx	r6
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 102 type 3
						// matchobj comparing flags 258 with 258
						// var, auto|reg
						// matchobj comparing flags 1 with 258
	.liconst	36
	ldidx	r6
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 491
						// (test)
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 258
						// var, auto|reg
						// matchobj comparing flags 1 with 258
	.liconst	12
						//sizemod based on type 0xa
	ldidx	r6

						//../DeMiSTify/firmware/minfat.c, line 491
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l170
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 491
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	8
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching

						//../DeMiSTify/firmware/minfat.c, line 491
						// (test)
						// (obj to tmp) flags 22 type 103
						// matchobj comparing flags 34 with 98
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 98
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 491
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l171
		add	r7
l170: # 

						//../DeMiSTify/firmware/minfat.c, line 492
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 493
						//pcreltotemp
	.lipcrel	l168
	add	r7
						// freereg r1
l171: # 

						//../DeMiSTify/firmware/minfat.c, line 493
						// (bitwise/arithmetic) 	//ops: 0, 0, 6
						// (obj to r5) flags 2 type a
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0xa
	ldidx	r6
	mr	r5
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	add	r5
						// (save result) // isreg
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 130
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r5
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 493
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 98
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	add	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 8, 0 with 4, 0
						//Fuzzy match found, offset: 4 (varadr: 1)
	.liconst	4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 22 type 103
						// matchobj comparing flags 34 with 1
						// matchobj comparing flags 34 with 130
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 1
						// matchobj comparing flags 162 with 130
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 493
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 34
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 34
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 493
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l174
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 494
						// (bitwise/arithmetic) 	//ops: 0, 0, 4
						// (obj to r3) flags 2 type 103
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r3
				//return 0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	sub	r3
						// (save result) // isreg
l174: # 

						//../DeMiSTify/firmware/minfat.c, line 495
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r3

						//../DeMiSTify/firmware/minfat.c, line 495
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l176
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 496
						//setreturn
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	mr	r0
				//return 0

						//../DeMiSTify/firmware/minfat.c, line 497
						//pcreltotemp
	.lipcrel	l168
	add	r7
l176: # 

						//../DeMiSTify/firmware/minfat.c, line 497
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	511
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x62
	mt	r0
	st	r6

						//../DeMiSTify/firmware/minfat.c, line 498
						// (test)
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 98

			// required value found in tmp
				// flags 62
	mr	r0
	and	r0

						//../DeMiSTify/firmware/minfat.c, line 498
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l196
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 500
						// (bitwise/arithmetic) 	//ops: 0, 7, 1
						// (obj to r0) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	512
	mr	r0
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 1
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r6
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 98
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/minfat.c, line 501
						// (bitwise/arithmetic) 	//ops: 0, 7, 3
						// (obj to r2) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 2
						// (prepobj r2)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	mr	r2
						// (obj to tmp) flags 62 type a
						// matchobj comparing flags 98 with 130
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 502
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 98
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
	sgn
	cmp	r3

						//../DeMiSTify/firmware/minfat.c, line 502
	cond	GE
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l180
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 503
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	12
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r3
						// freereg r1
l180: # 

						//../DeMiSTify/firmware/minfat.c, line 504
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x62
	mt	r0
	st	r5

						//../DeMiSTify/firmware/minfat.c, line 505
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 98
						// matchobj comparing flags 2 with 98
						// var, auto|reg
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	sub	r3
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 506
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 506
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/minfat.c, line 506
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 506
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l196
		add	r7
l193: # 

						//../DeMiSTify/firmware/minfat.c, line 507
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 6a type 101
						// deref 
	ldbinc	r2
						// (save temp)store type 1
	byt
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 507
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	1
	add	r4
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 506
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 506
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/minfat.c, line 506
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 506
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l193
		add	r7
l196: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 509
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r3

						//../DeMiSTify/firmware/minfat.c, line 509
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l197
		add	r7
						// freereg r1
l194: # 

						//../DeMiSTify/firmware/minfat.c, line 511
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 511
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 511
						//call
						//pcreltotemp
	.lipcrel	_FileNextSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 512
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	511
	sgn
	cmp	r3

						//../DeMiSTify/firmware/minfat.c, line 512
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l188
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 514
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 514
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 514
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 515
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	512
	add	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 516
						// (bitwise/arithmetic) 	//ops: 6, 0, 1
						// (obj to r0) flags 62 type 103
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r5
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	512
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x62
	mt	r0
	st	r5

						//../DeMiSTify/firmware/minfat.c, line 517
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	512
	sub	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 520
						//pcreltotemp
	.lipcrel	l198
	add	r7
l188: # 

						//../DeMiSTify/firmware/minfat.c, line 521
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 521
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 521
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 522
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 523
						// (bitwise/arithmetic) 	//ops: 4, 6, 1
						// (obj to r0) flags 42 type 103
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 66
						// matchobj comparing flags 98 with 66
						// deref 
	ld	r5
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x62
	mt	r0
	st	r5
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 524
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 98
						// matchobj comparing flags 66 with 98
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 524
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 98
	.liconst	1
	sub	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 524
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 98
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 524
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l198
		add	r7
l195: # 

						//../DeMiSTify/firmware/minfat.c, line 525
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 6a type 101
						// deref 
	ldbinc	r2
						// (save temp)store type 1
	byt
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 525
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	1
	add	r4
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 524
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 524
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	sub	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 524
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 524
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l195
		add	r7
l198: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 509
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r3

						//../DeMiSTify/firmware/minfat.c, line 509
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l194
		add	r7
						// freereg r1
l197: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 528
						//setreturn
						// (obj to r0) flags 1 type 103
						// const
	.liconst	1
	mr	r0
l168: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-16
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.c
	.global	_FileGetCh
_FileGetCh:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 534
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
				// flags 42
	and	r3

						//../DeMiSTify/firmware/minfat.c, line 534
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l201
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 534
						// (bitwise/arithmetic) 	//ops: 4, 0, 6
						//Special case - addt
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	addt	r3
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 534
						// (test)
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 66
						// deref 
	ld	r5

						//../DeMiSTify/firmware/minfat.c, line 534
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l202
		add	r7
l201: # 

						//../DeMiSTify/firmware/minfat.c, line 535
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	-1
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 536
						//pcreltotemp
	.lipcrel	l210
	add	r7
						// freereg r1
l202: # 

						//../DeMiSTify/firmware/minfat.c, line 536
						// (bitwise/arithmetic) 	//ops: 4, 0, 5
						//Special case - addt
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	16
	addt	r3
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 536
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 62 type 103
						// matchobj comparing flags 98 with 66
						// deref 
	ld	r4
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	511
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 536
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l205
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 538
						// (test)
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r4

						//../DeMiSTify/firmware/minfat.c, line 538
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l207
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 539
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	1
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 539
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 539
						//call
						//pcreltotemp
	.lipcrel	_FileNextSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l207: # 

						//../DeMiSTify/firmware/minfat.c, line 540
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 540
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 540
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l205: # 
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 62 type 103
						// deref 
	ld	r4
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 542
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 98
						// deref 
	ld	r5
	cmp	r2

						//../DeMiSTify/firmware/minfat.c, line 542
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l209
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 543
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	-1
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 544
						//pcreltotemp
	.lipcrel	l210
	add	r7
						// freereg r1
l209: # 

						//../DeMiSTify/firmware/minfat.c, line 545
						// Z disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	1
	addt	r2
						// (save temp)store type 3
	st	r4
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 545
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 98
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	511
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 545
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 545
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 130
						// deref 
	byt
	ld	r1
						// (save temp)isreg
	mr	r0
						//save_temp done
						// freereg r1
l210: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.d
	.global	_LoadFile
_LoadFile:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-72
	add	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type a
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r5
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 102 type a
						// matchobj comparing flags 258 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	88
	ldidx	r6
						// (save temp)isreg
	mr	r5
						//save_temp done
						// allocreg r4
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 552
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 258
						// reg r2 - only match against tmp
	mt	r2
	stdec	r6

						//../DeMiSTify/firmware/minfat.c, line 552
						// (address)
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	4
	addt	r6
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 552
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 552
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 552
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 552
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l214
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 554
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 557
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 557
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l220
		add	r7
						// freereg r1
l221: # 

						//../DeMiSTify/firmware/minfat.c, line 559
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// reg r5 - only match against tmp
	mt	r5
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 559
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 559
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 559
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 559
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l219
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 560
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 561
						//pcreltotemp
	.lipcrel	l211
	add	r7
						// freereg r1
l219: # 

						//../DeMiSTify/firmware/minfat.c, line 561
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 561
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 561
						//call
						//pcreltotemp
	.lipcrel	_FileNextSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 563
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	512
	add	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 564
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	add	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 557
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r3

						//../DeMiSTify/firmware/minfat.c, line 557
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l221
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 568
						//pcreltotemp
	.lipcrel	l220
	add	r7
l214: # 

						//../DeMiSTify/firmware/minfat.c, line 570
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 571
						//pcreltotemp
	.lipcrel	l211
	add	r7
l220: # 

						//../DeMiSTify/firmware/minfat.c, line 572
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	1
	mr	r0
l211: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-72
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.e
	.global	_ChangeDirectoryByCluster
_ChangeDirectoryByCluster:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 103
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 578
						// (test)
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
				// flags 42
	and	r3

						//../DeMiSTify/firmware/minfat.c, line 578
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l226
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 580
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_current_directory_cluster, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r3
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 581
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 42 type 103
						// reg r3 - only match against tmp
	mt	r3
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	2
	sub	r2
						// (save result) // isreg
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 581
						// (bitwise/arithmetic) 	//ops: 2, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	//mt
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 581
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 3, 1
						// (obj to r0) flags 2 type 103
						// extern
	.liabs	_data_start
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_current_directory_start, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2

						//../DeMiSTify/firmware/minfat.c, line 582
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	4
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_dir_entries, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 585
						//pcreltotemp
	.lipcrel	l227
	add	r7
l226: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 586
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_current_directory_cluster
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_root_directory_cluster
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 587
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_current_directory_start
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_root_directory_start
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 588
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 588
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l229
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 588
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	4
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 588
						//pcreltotemp
	.lipcrel	l230
	add	r7
l229: # 

						//../DeMiSTify/firmware/minfat.c, line 588
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// extern
	.liabs	_root_directory_size
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	shl	r1
						// (save result) // isreg
l230: # 

						//../DeMiSTify/firmware/minfat.c, line 588
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_dir_entries, 4
						// extern pe not varadr
						//sizemod based on type 0x103
	stmpdec	r1
l227: # 
						// freereg r1
						// freereg r3
	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.f
	.global	_CurrentDirectory
_CurrentDirectory:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_current_directory_cluster
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 595
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_root_directory_cluster
						//extern deref
						//sizemod based on type 0x103
	ldt
	cmp	r1

						//../DeMiSTify/firmware/minfat.c, line 595
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l234
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 595
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 595
						//pcreltotemp
	.lipcrel	l235
	add	r7
l234: # 

						//../DeMiSTify/firmware/minfat.c, line 595
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
l235: # 

						//../DeMiSTify/firmware/minfat.c, line 595
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 103
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.10
	.global	_ChangeDirectory
_ChangeDirectory:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r4
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 601
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 602
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//../DeMiSTify/firmware/minfat.c, line 602
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l239
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 604
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	26
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 604
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 102
						// matchobj comparing flags 106 with 74
						// deref 
	hlf
	ld	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 605
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 106
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 605
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l241
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 605
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	20
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 605
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 102
						// matchobj comparing flags 106 with 74
						// deref 
	hlf
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 605
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	//mt
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4095
	and	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 605
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16
	shl	r4
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 605
						//pcreltotemp
	.lipcrel	l242
	add	r7
l241: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 605
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
l242: # 

						//../DeMiSTify/firmware/minfat.c, line 605
						// (bitwise/arithmetic) 	//ops: 5, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
	or	r3
						// (save result) // isreg
						// freereg r1
l239: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 607
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 607
						//call
						//pcreltotemp
	.lipcrel	_ChangeDirectoryByCluster
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.11
	.global	_NextDirEntry
_NextDirEntry:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-16
	add	r6
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r1
						// freereg r1
						// allocreg r5
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	268435448
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 617
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 619
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6

						//../DeMiSTify/firmware/minfat.c, line 619
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l250
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 621
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l248,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 4
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 622
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l246,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_current_directory_start
						//extern deref
						//sizemod based on type 0x104
	ldt
						// (save temp)store type 4
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 623
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l247,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_current_directory_cluster
						//extern deref
						//sizemod based on type 0x104
	ldt
						// (save temp)store type 4
	st	r0
						//save_temp done
l250: # 

						//../DeMiSTify/firmware/minfat.c, line 626
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 13)
	.liabs	_longfilename, 13
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
l289: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 631
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 104
						// extern
	.liabs	_dir_entries
						//extern deref
						//sizemod based on type 0x104
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l248,0
						//static deref
						//sizemod based on type 0x104
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 631
						// Q2 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	cmp	r2
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 631
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l292
		add	r7
l290: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 633
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 104
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	15
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 633
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l258
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 635
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_cachedsector
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l246,0
						//static deref
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 636
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 636
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l246,0
						//static deref
						//sizemod based on type 0x104
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 636
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l246,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type 4
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1

						//../DeMiSTify/firmware/minfat.c, line 636
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 636
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 637
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l245,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)store type a
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 640
						//pcreltotemp
	.lipcrel	l259
	add	r7
l258: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 640
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l245,0
						//static deref
						//sizemod based on type 0xa
	ldt
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	32
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l245,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
l259: # 

						//../DeMiSTify/firmware/minfat.c, line 641
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 104
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l248,0
						//static deref
						//sizemod based on type 0x104
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l248,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching

						//../DeMiSTify/firmware/minfat.c, line 643
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r5)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 22 type 101
						// matchobj comparing flags 34 with 130
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 130
						// deref
						// var FIXME - deref?
						// static
	ldinc	r7
	.ref	l245,0
	ldt
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 643
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 34
						// reg r5 - only match against tmp
	//mt
				// flags 42
	and	r5

						//../DeMiSTify/firmware/minfat.c, line 643
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l273
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 643
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	229
	cmp	r5

						//../DeMiSTify/firmware/minfat.c, line 643
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l273
		add	r7
						// freereg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l245,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 646
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	11
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 646
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r4)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 646
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	15
	cmp	r4

						//../DeMiSTify/firmware/minfat.c, line 646
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l264
		add	r7
						// freereg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 650
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	31
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 650
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 650
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	13
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 651
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_longfilename
						// extern pe is varadr
	add	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 652
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 652
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 653
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	3
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 653
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 654
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	5
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 654
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 655
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	7
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 655
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 656
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	9
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 656
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 658
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	14
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 658
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 659
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	16
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 659
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 660
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	18
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 660
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 661
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	20
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 661
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 662
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	22
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 662
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 663
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	24
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 663
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 665
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	28
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 665
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 666
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	30
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 666
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 667
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	1
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 675
						//pcreltotemp
	.lipcrel	l273
	add	r7
l264: # 
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 676
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 676
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l267
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 676
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	16
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 676
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l266
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 676
						// (test)
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	32
	ldidx	r6

						//../DeMiSTify/firmware/minfat.c, line 676
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l266
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 676
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 676
						//call
						// (obj to tmp) flags 22 type f
						// matchobj comparing flags 34 with 66
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 66
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 66
	.liconst	32
	ldidx	r6
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 676
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 676
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l267
		add	r7
l266: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 679
						// (test)
						// (obj to tmp) flags 62 type 3
						// deref 
	ld	r6

						//../DeMiSTify/firmware/minfat.c, line 679
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l272
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 680
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 98
						// extern (offset 0)
	.liabs	_longfilename
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
l272: # 

						//../DeMiSTify/firmware/minfat.c, line 684
						//setreturn
						// (obj to r0) flags 2 type a
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l245,0
						//static deref
						//sizemod based on type 0xa
	ldt
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 685
						//pcreltotemp
	.lipcrel	l243
	add	r7
l267: # 

						//../DeMiSTify/firmware/minfat.c, line 689
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 13)
	.liabs	_longfilename, 13
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 691
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r6
						//save_temp done
						// freereg r1
l273: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 631
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 104
						// extern
	.liabs	_dir_entries
						//extern deref
						//sizemod based on type 0x104
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l248,0
						//static deref
						//sizemod based on type 0x104
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 631
						// Q2 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	cmp	r2
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 631
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l290
		add	r7
l292: # 
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	268435448
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 697
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_current_directory_start
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 697
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l274
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 697
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 697
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l291
		add	r7
						// freereg r1
l274: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 699
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l247,0
						//static deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 699
						//call
						//pcreltotemp
	.lipcrel	_GetCluster
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 699
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l247,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l247,0
						//static deref
						//sizemod based on type 0x104
	ldt
						// (save temp)store type 4
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 701
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 701
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l280
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 701
						// (bitwise/arithmetic) 	//ops: 0, 5, 2
						// (obj to r1) flags 2 type 104
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	4
						//sizemod based on type 0x104
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 240 type 104
						// matchobj comparing flags 576 with 2
						// matchobj comparing flags 576 with 130
						// reg r4 - only match against tmp
	mt	r4
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 701
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 240 type 104
						// matchobj comparing flags 576 with 576
						// matchobj comparing flags 576 with 130
						// reg r4 - only match against tmp
	mt	r4
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 701
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l282
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 701
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 576
						// matchobj comparing flags 138 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 576
						// matchobj comparing flags 1 with 130
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 701
						//pcreltotemp
	.lipcrel	l281
	add	r7
l282: # 

						//../DeMiSTify/firmware/minfat.c, line 701
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 701
						//pcreltotemp
	.lipcrel	l281
	add	r7
						// freereg r1
l280: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 701
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 104
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x104
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	65528
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 701
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 701
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l285
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 701
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 701
						//pcreltotemp
	.lipcrel	l286
	add	r7
l285: # 

						//../DeMiSTify/firmware/minfat.c, line 701
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	12
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
l286: # 

						//../DeMiSTify/firmware/minfat.c, line 701
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 138
						// var, auto|reg
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)store type 3
	st	r0
						//save_temp done
l281: # 

						//../DeMiSTify/firmware/minfat.c, line 701
						// (test)
						// (obj to tmp) flags a type 3
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6

						//../DeMiSTify/firmware/minfat.c, line 701
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l291
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 704
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 104
						// matchobj comparing flags 2 with 10
						// var, auto|reg
						// matchobj comparing flags 1 with 10
	.liconst	4
						//sizemod based on type 0x104
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 704
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x104
	ldt
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 704
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type 104
						// extern
	.liabs	_data_start
						//extern deref
						//sizemod based on type 0x104
	ldt
	mr	r0
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l246,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 705
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// static
	.liabs	l248,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 4
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 708
						//pcreltotemp
	.lipcrel	l289
	add	r7
l291: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 710
						//setreturn
						// (obj to r0) flags 1 type a
						// const
	.liconst	0
	mr	r0
l243: # 
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	268435448
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
						// matchobj comparing flags 1 with 1
	.liconst	-16
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.data.12
	.align	4
l245:
	.int	0
	.section	.bss.13
	.align	4
	.lcomm	l246,4
	.section	.bss.14
	.align	4
	.lcomm	l247,4
	.section	.bss.15
	.align	4
	.lcomm	l248,4
	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.16
	.global	_FindByCluster
_FindByCluster:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-4
	add	r6
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 40 type 103
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r6
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 717
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 64
						// deref 
	ld	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 717
						//call
						//pcreltotemp
	.lipcrel	_ChangeDirectoryByCluster
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 718
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type a
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 718
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 718
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 718
						//call
						//pcreltotemp
	.lipcrel	_NextDirEntry
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 718
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r2

						//../DeMiSTify/firmware/minfat.c, line 718
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r2 - only match against tmp
				// flags 42
	and	r2

						//../DeMiSTify/firmware/minfat.c, line 718
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l310
		add	r7
l309: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 721
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	26
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 721
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 102
						// matchobj comparing flags 106 with 74
						// deref 
	hlf
	ld	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 722
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 106
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 722
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l302
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 722
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	20
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 722
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 102
						// matchobj comparing flags 106 with 74
						// deref 
	hlf
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 722
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	//mt
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4095
	and	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 722
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16
	shl	r4
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 722
						//pcreltotemp
	.lipcrel	l303
	add	r7
l302: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 722
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
l303: # 

						//../DeMiSTify/firmware/minfat.c, line 722
						// (bitwise/arithmetic) 	//ops: 5, 4, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
	addt	r3
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 723
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	20
	ldidx	r6
	cmp	r3

						//../DeMiSTify/firmware/minfat.c, line 723
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l305
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 724
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 725
						//pcreltotemp
	.lipcrel	l293
	add	r7
l305: # 

						//../DeMiSTify/firmware/minfat.c, line 718
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type a
						// const
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/minfat.c, line 718
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//../DeMiSTify/firmware/minfat.c, line 718
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l306
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 718
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 718
						//pcreltotemp
	.lipcrel	l307
	add	r7
l306: # 

						//../DeMiSTify/firmware/minfat.c, line 718
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
l307: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 718
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 718
						//call
						//pcreltotemp
	.lipcrel	_NextDirEntry
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 718
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r2

						//../DeMiSTify/firmware/minfat.c, line 718
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r2 - only match against tmp
				// flags 42
	and	r2

						//../DeMiSTify/firmware/minfat.c, line 718
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l309
		add	r7
l310: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 726
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0
l293: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-4
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.17
	.global	_ValidateDirectory
_ValidateDirectory:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-12
	add	r6
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
						//sizemod based on type 0x103
	stmpdec	r1
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 740
						// (test)
						// (obj to tmp) flags 2 type 103
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6

						//../DeMiSTify/firmware/minfat.c, line 740
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l313
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 740
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_root_directory_cluster
						//extern deref
						//sizemod based on type 0x103
	ldt
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 740
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l314
		add	r7
l313: # 

						//../DeMiSTify/firmware/minfat.c, line 742
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	1
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 743
						//pcreltotemp
	.lipcrel	l311
	add	r7
						// freereg r1
l314: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 747
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 104
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x104
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 747
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_cluster_size
						//extern deref
						//sizemod based on type 0x104
	ldt
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 747
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 104
						// extern
	.liabs	_data_start
						//extern deref
						//sizemod based on type 0x104
	ldt
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 750
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6

						//../DeMiSTify/firmware/minfat.c, line 750
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 750
						//call
						//pcreltotemp
	.lipcrel	_sd_read_sector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 750
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 750
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l318
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 751
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 752
						//pcreltotemp
	.lipcrel	l311
	add	r7
l318: # 

						//../DeMiSTify/firmware/minfat.c, line 752
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 753
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 4
	st	r6
						//save_temp done
l338: # 

						//../DeMiSTify/firmware/minfat.c, line 755
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 62 type 101
						// deref 
	byt
	ld	r4
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/minfat.c, line 755
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
				// flags 2
	//mr
	and	r0

						//../DeMiSTify/firmware/minfat.c, line 755
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l329
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 755
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	229
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 755
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l329
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 757
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	11
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 757
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	byt
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 757
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	16
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 757
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l329
		add	r7
						// freereg r2
						// freereg r3
						// allocreg r2

						//../DeMiSTify/firmware/minfat.c, line 759
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 759
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l330,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/minfat.c, line 759
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	8
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 759
						//call
						//pcreltotemp
	.lipcrel	___strncmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 759
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 759
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l329
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 761
						// (bitwise/arithmetic) 	//ops: 5, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	26
	addt	r4
						// (save temp)store type a
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 761
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 106
						// extern
	.liabs	_fat32
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/minfat.c, line 761
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l332
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 761
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	20
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 761
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 102
						// matchobj comparing flags 106 with 74
						// deref 
	hlf
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 761
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 6
						// (obj to r5) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	//mt
	mr	r5
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4095
	and	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 761
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16
	shl	r5
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 761
						//pcreltotemp
	.lipcrel	l333
	add	r7
l332: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 761
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
l333: # 
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 761
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2a type 102
						// deref 
						// (prepobj tmp)
 						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x102
	hlf
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 761
						// (bitwise/arithmetic) 	//ops: 2, 6, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 42
						// reg r5 - only match against tmp
	mt	r5
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 761
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 104
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	12
	addt	r6
						//sizemod based on type 0x104
	stmpdec	r1
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 764
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 764
						//call
						//pcreltotemp
	.lipcrel	_ValidateDirectory
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 764
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 764
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l336
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 764
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 764
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 764
						//call
						//pcreltotemp
	.lipcrel	_FindByCluster
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 764
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/minfat.c, line 764
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l336
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/minfat.c, line 764
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/minfat.c, line 764
						//pcreltotemp
	.lipcrel	l337
	add	r7
l336: # 

						//../DeMiSTify/firmware/minfat.c, line 764
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done
l337: # 

						//../DeMiSTify/firmware/minfat.c, line 764
						//setreturn
						// (obj to r0) flags 6a type 3
						// deref 
	ld	r6
	mr	r0

						//../DeMiSTify/firmware/minfat.c, line 768
						//pcreltotemp
	.lipcrel	l311
	add	r7
l329: # 

						//../DeMiSTify/firmware/minfat.c, line 771
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	32
	add	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/minfat.c, line 754
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 62 type 104
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching

						//../DeMiSTify/firmware/minfat.c, line 754
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 62 type 104
						// matchobj comparing flags 98 with 98

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	16
	cmp	r0

						//../DeMiSTify/firmware/minfat.c, line 754
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l338
		add	r7

						//../DeMiSTify/firmware/minfat.c, line 773
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0
l311: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-12
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.rodata.18
	.align	4
l330:
	.byte	46
	.byte	46
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.section	.data.19
	.align	4
	.global	_cachedsector
_cachedsector:
	.int	4294967295
	.section	.data.1a
	.align	4
	.global	_FAT32_ID
_FAT32_ID:
						// Declaring from tree
						// static
	.ref	l1
	.section	.data.1b
	.align	4
	.global	_FAT16_ID
_FAT16_ID:
						// Declaring from tree
						// static
	.ref	l2
	.section	.bss.1c
	.align	4
	.global	_sector_buffer
	.comm	_sector_buffer,512
	.section	.bss.1d
	.align	4
	.global	_cluster_size
	.comm	_cluster_size,4
	.section	.bss.1e
	.align	4
	.global	_cluster_mask
	.comm	_cluster_mask,4
	.section	.bss.1f
	.align	4
	.global	_fat32
	.comm	_fat32,4
	.section	.bss.20
	.align	4
	.global	_dir_entries
	.comm	_dir_entries,4
	.section	.bss.21
	.align	4
	.global	_longfilename
	.comm	_longfilename,261
	.section	.bss.22
	.align	4
	.global	_fat_start
	.comm	_fat_start,4
	.section	.bss.23
	.align	4
	.global	_data_start
	.comm	_data_start,4
	.section	.bss.24
	.align	4
	.global	_root_directory_cluster
	.comm	_root_directory_cluster,4
	.section	.bss.25
	.align	4
	.global	_root_directory_start
	.comm	_root_directory_start,4
	.section	.bss.26
	.align	4
	.global	_root_directory_size
	.comm	_root_directory_size,4
	.section	.bss.27
	.align	4
	.global	_current_directory_cluster
	.comm	_current_directory_cluster,4
	.section	.bss.28
	.align	4
	.global	_current_directory_start
	.comm	_current_directory_start,4
	.section	.rodata.29
	.align	4
l1:
	.byte	70
	.byte	65
	.byte	84
	.byte	51
	.byte	50
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.section	.rodata.2a
	.align	4
l2:
	.byte	70
	.byte	65
	.byte	84
	.byte	49
	.byte	54
	.byte	32
	.byte	32
	.byte	32
	.byte	0
