	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
l1:
	stdec	r6
	mt	r3
	stdec	r6
	.liconst	-4
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
						// allocreg r2

						//c64keys.c, line 133
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	48
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//c64keys.c, line 133
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	44
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 133
						// (bitwise/arithmetic) 	//ops: 3, 2, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r1
	add	r2
						// (save result) // isreg

						//c64keys.c, line 133
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 106
						// var, auto|reg
						// matchobj comparing flags 1 with 106
	.liconst	12
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r2
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2

						//c64keys.c, line 134
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 6a type 403
						// matchobj comparing flags 106 with 2
						// deref 
	ld	r1
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0x6a
	mt	r0
	st	r6

						//c64keys.c, line 134
						// Z disposable
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 6a type 403
						// matchobj comparing flags 106 with 106

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	15
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0x6a
	mt	r0
	st	r1
						// freereg r1
						// freereg r3
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	-4
	sub	r6
	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_c64keyboard_write
_c64keyboard_write:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
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
						// allocreg r4

						//c64keys.c, line 139
						//call
						//pcreltotemp
	.lipcrel	_Menu_Visible
	add	r7
						// Flow control - popping 0 + 0 bytes

						//c64keys.c, line 139
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//c64keys.c, line 140
						//call
						//pcreltotemp
	.lipcrel	_DisableInterrupts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//c64keys.c, line 141
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	12
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	128
	and	r1
						// (save result) // isreg
						// freereg r1

						//c64keys.c, line 141
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l7
		add	r7
						// allocreg r1

						//c64keys.c, line 143
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//c64keys.c, line 143
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l9
		add	r7
						// freereg r1

						//c64keys.c, line 144
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	224
	stdec	r6
						// allocreg r1

						//c64keys.c, line 144
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

						//c64keys.c, line 144
						//call
						//pcreltotemp
	.lipcrel	l1
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l9: # 

						//c64keys.c, line 145
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	224
	stdec	r6
						// allocreg r1

						//c64keys.c, line 145
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_kbbuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 145
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_receive
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l7: # 
						// allocreg r1

						//c64keys.c, line 147
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	12
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	256
	and	r1
						// (save result) // isreg
						// freereg r1

						//c64keys.c, line 147
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l11
		add	r7
						// allocreg r1

						//c64keys.c, line 149
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//c64keys.c, line 149
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l13
		add	r7
						// freereg r1

						//c64keys.c, line 150
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	240
	stdec	r6
						// allocreg r1

						//c64keys.c, line 150
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

						//c64keys.c, line 150
						//call
						//pcreltotemp
	.lipcrel	l1
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l13: # 

						//c64keys.c, line 151
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	240
	stdec	r6
						// allocreg r1

						//c64keys.c, line 151
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_kbbuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 151
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_receive
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l11: # 
						// allocreg r1

						//c64keys.c, line 153
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//c64keys.c, line 153
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l15
		add	r7
						// freereg r1
						// allocreg r1

						//c64keys.c, line 154
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	12
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	127
	and	r1
						// (save result) // isreg

						//c64keys.c, line 154
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//c64keys.c, line 154
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 74
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 154
						//call
						//pcreltotemp
	.lipcrel	l1
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l15: # 
						// allocreg r1

						//c64keys.c, line 155
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	12
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	127
	and	r1
						// (save result) // isreg

						//c64keys.c, line 155
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//c64keys.c, line 155
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_kbbuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 155
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_receive
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//c64keys.c, line 156
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r3
						// freereg r4
	.liconst	-4
	sub	r6
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
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_sendc64keys
_sendc64keys:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
	.liconst	-4
	add	r6
						// allocreg r4
						// allocreg r3
						// allocreg r2

						//c64keys.c, line 165
						//call
						//pcreltotemp
	.lipcrel	_DisableInterrupts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//c64keys.c, line 166
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l18,0
						//static deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 166
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//c64keys.c, line 166
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//c64keys.c, line 166
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l20
		add	r7
						// allocreg r1

						//c64keys.c, line 166
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 403
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_c64keys, 40
						//extern deref
						//sizemod based on type 0x403
	ldt
	mr	r0
						// (obj to tmp) flags 2 type 403
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_c64keys, 44
						//extern deref
						//sizemod based on type 0x403
	ldt
	cmp	r0

						//c64keys.c, line 166
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l20
		add	r7
						// freereg r1
						// allocreg r1

						//c64keys.c, line 168
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj r1)
 						// matchobj comparing flags 130 with 2
						// extern (offset 48)
	.liabs	_c64keys, 48
						// extern pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_c64keys, 40
						//extern deref
						//sizemod based on type 0xa
	ldt
	add	r1
						// (save result) // isreg

						//c64keys.c, line 168
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 2
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1

						//c64keys.c, line 169
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 106
						// reg r4 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//c64keys.c, line 169
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	224
	cmp	r2

						//c64keys.c, line 169
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l22
		add	r7
						// allocreg r1

						//c64keys.c, line 169
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	240
	cmp	r2

						//c64keys.c, line 169
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l23
		add	r7
l22: # 

						//c64keys.c, line 169
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	4
						// (save temp)isreg
	mr	r3
						//save_temp done

						//c64keys.c, line 169
						//pcreltotemp
	.lipcrel	l24
	add	r7
l23: # 

						//c64keys.c, line 169
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	15
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l24: # 
						// allocreg r1

						//c64keys.c, line 169
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 169
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//c64keys.c, line 169
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l18,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//c64keys.c, line 170
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 130
						// matchobj comparing flags 161 with 2
						// deref
						// const to r0
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	545
						// (save temp)store type 3
	st	r0
						//save_temp done

						//c64keys.c, line 171
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	5
						// (save temp)store type 3
	st	r0
						//save_temp done

						//c64keys.c, line 172
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 42 type 101
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 66
						// matchobj comparing flags 161 with 66
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness

						//c64keys.c, line 173
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)store type 3
	st	r0
						//save_temp done

						//c64keys.c, line 174
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 403
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_c64keys, 40
						//extern deref
						//sizemod based on type 0x403
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0x6a
	mt	r0
	st	r6

						//c64keys.c, line 174
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 6a type 403
						// matchobj comparing flags 106 with 106

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	15
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0x2
						// (prepobj tmp)
 						// extern (offset 40)
	.liabs	_c64keys, 44
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
l20: # 
						// allocreg r1

						//c64keys.c, line 176
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
	.liconst	-4
	sub	r6
	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.data.3
	.align	4
l18:
	.int	0
	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.4
	.global	_handlec64keys
_handlec64keys:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-36
	add	r6
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2

						//c64keys.c, line 186
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
						// allocreg r1

						//c64keys.c, line 188
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_c64keys, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	add	r1
						// (save result) // isreg

						//c64keys.c, line 188
						// Q1 disposable
						//Call division routine
	mt	r1
	stdec	r6
	mt	r2
	stdec	r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	6
	mr	r2
	.lipcrel	_div_s32bys32
	add	r7
	mt	r1
	mr	r0
	ldinc	r6
	mr	r2
	ldinc	r6
	mr	r1
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
						// allocreg r1

						//c64keys.c, line 189
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_c64keys, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	add	r1
						// (save result) // isreg

						//c64keys.c, line 189
						// Q1 disposable
						//Call division routine
	mt	r1
	stdec	r6
	mt	r2
	stdec	r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	6
	mr	r2
	.lipcrel	_div_s32bys32
	add	r7
	mt	r1
	mr	r0
	ldinc	r6
	mr	r2
	ldinc	r6
	mr	r1
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//c64keys.c, line 194
						//call
						//pcreltotemp
	.lipcrel	_sendc64keys
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//c64keys.c, line 196
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l28,0
						//static deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 196
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//c64keys.c, line 196
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//c64keys.c, line 196
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7
						// allocreg r1

						//c64keys.c, line 198
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	32
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 198
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//c64keys.c, line 198
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l28,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//c64keys.c, line 200
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
l87: # 
						// allocreg r1

						//c64keys.c, line 202
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	mul	r1
						// (save result) // isreg

						//c64keys.c, line 202
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	-112
	add	r1
						// (save result) // isreg

						//c64keys.c, line 202
						//FIXME convert
						// (convert - reducing type 103 to a
						//No need to mask - same size

						//c64keys.c, line 202
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r1

						//c64keys.c, line 203
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 106
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_c64keys, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
	add	r1
						// (save result) // isreg

						//c64keys.c, line 203
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	mul	r1
						// (save result) // isreg

						//c64keys.c, line 203
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 16)
	.liabs	_c64keys, 16
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//c64keys.c, line 203
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 130
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1

						//c64keys.c, line 204
						// (test)
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 66
						// reg r2 - only match against tmp
				// flags 42
	and	r2

						//c64keys.c, line 204
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l92
		add	r7
l88: # 
						// allocreg r1

						//c64keys.c, line 206
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 103
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	sub	r1
						// (save result) // isreg

						//c64keys.c, line 206
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	and	r2
						// (save result) // isreg
						// freereg r1

						//c64keys.c, line 207
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 62 type 3
						// matchobj comparing flags 98 with 74
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x62
	mt	r0
	st	r6

						//c64keys.c, line 204
						// (test)
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 98
						// matchobj comparing flags 66 with 98
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//c64keys.c, line 204
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l88
		add	r7
l92: # 
						// allocreg r1

						//c64keys.c, line 201
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r4
						// (save result) // isreg

						//c64keys.c, line 201
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	sgn
	cmp	r4

						//c64keys.c, line 201
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l87
		add	r7
						// freereg r1
						// allocreg r1

						//c64keys.c, line 213
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
	.liconst	60
	sgn
	cmp	r0

						//c64keys.c, line 213
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7

						//c64keys.c, line 215
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// freereg r2
						// freereg r3
l89: # 
						// allocreg r2

						//c64keys.c, line 241
						// (bitwise/arithmetic) 	//ops: 5, 0, 3
						// (obj to r2) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r2
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	add	r2
						// (save result) // isreg

						//c64keys.c, line 241
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	mul	r2
						// (save result) // isreg

						//c64keys.c, line 241
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 16)
	.liabs	_c64keys, 16
						// extern pe is varadr
	add	r2
						// (save result) // isreg
						// allocreg r1

						//c64keys.c, line 241
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
	add	r1
						// (save result) // isreg

						//c64keys.c, line 241
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	mul	r1
						// (save result) // isreg

						//c64keys.c, line 241
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 16)
	.liabs	_c64keys, 16
						// extern pe is varadr
	add	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 130
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r2
						//save_temp done

						//c64keys.c, line 241
						// (bitwise/arithmetic) 	//ops: 2, 3, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to r1) flags 6a type 103
						// matchobj comparing flags 106 with 106
						// deref 
	ld	r1
	mr	r1
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	mt	r2
	xor	r1
						// (save result) // isreg
						// allocreg r3

						//c64keys.c, line 241
						// (bitwise/arithmetic) 	//ops: 5, 0, 4
						// (obj to r3) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// reg r4 - only match against tmp
	mt	r4
	mr	r3
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_c64keys, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
	add	r3
						// (save result) // isreg

						//c64keys.c, line 241
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	mul	r3
						// (save result) // isreg

						//c64keys.c, line 241
						// (bitwise/arithmetic) 	//ops: 0, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 16)
	.liabs	_c64keys, 16
						// extern pe is varadr
	add	r3
						// (save result) // isreg

						//c64keys.c, line 241
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 130
						// deref 
	ld	r3
	xor	r2
						// (save result) // isreg
						// freereg r3

						//c64keys.c, line 241
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	24
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2
						// freereg r1
						// allocreg r1

						//c64keys.c, line 242
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_c64keys, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
	add	r1
						// (save result) // isreg

						//c64keys.c, line 242
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	mul	r1
						// (save result) // isreg

						//c64keys.c, line 242
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 16)
	.liabs	_c64keys, 16
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//c64keys.c, line 242
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 130
						// matchobj comparing flags 106 with 2
						// deref 
	ld	r1
						// (save temp)store type 3
	st	r6
						//save_temp done
						// freereg r1

						//c64keys.c, line 243
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 106
						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 2
	.liconst	24
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	20
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r4
l90: # 
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//c64keys.c, line 246
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	31
	shr	r1
						// (save result) // isreg
						// freereg r1

						//c64keys.c, line 246
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l86
		add	r7
						// freereg r2
						// allocreg r2

						//c64keys.c, line 248
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
						//sizemod based on type 0x3
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	32
	mul	r2
						// (save result) // isreg

						//c64keys.c, line 248
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6
	add	r2
						// (save result) // isreg

						//c64keys.c, line 248
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	63
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	sub	r0
						// (save result) // isreg
	mt	r0
	mr	r2

						//c64keys.c, line 250
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	28
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//c64keys.c, line 251
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 32, 0 with 28, 0
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
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//c64keys.c, line 252
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type 103
						// matchobj comparing flags 98 with 1
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 130
	.liconst	31
	shr	r1
						// (save result) // isreg

						//c64keys.c, line 252
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						//Saving to reg r4
						// (save temp)isreg
	mr	r4
						//save_temp done
						//No need to mask - same size
						// freereg r1

						//c64keys.c, line 254
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 130
						// extern (offset 0)
	.liabs	_c64keys
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//c64keys.c, line 255
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
	.liconst	3
	shl	r1
						// (save result) // isreg

						//c64keys.c, line 255
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sgn
	shr	r2
						// (save result) // isreg

						//c64keys.c, line 255
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2

						//c64keys.c, line 255
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
	.liconst	63
	and	r1
						// (save result) // isreg

						//c64keys.c, line 256
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	4
	mul	r1
						// (save result) // isreg

						//c64keys.c, line 256
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 6
						// (obj to r5) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// (prepobj r5)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_c64keytable
						// extern pe is varadr
	mr	r5
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	add	r5
						// (save result) // isreg
						// freereg r1

						//c64keys.c, line 256
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 62 type 3
						// matchobj comparing flags 98 with 74
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r5
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//c64keys.c, line 260
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 98
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
	.liconst	16384
	and	r1
						// (save result) // isreg
						// freereg r1

						//c64keys.c, line 260
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l51
		add	r7
						// allocreg r2
						// allocreg r1

						//c64keys.c, line 262
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//c64keys.c, line 262
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l53
		add	r7

						//c64keys.c, line 263
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 66
						// matchobj comparing flags 130 with 130
						//extern: comparing 8 with 0
						//Fuzzy match found, offset: 8 (varadr: 1)
	.liconst	8
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//c64keys.c, line 265
						//pcreltotemp
	.lipcrel	l86
	add	r7
l53: # 

						//c64keys.c, line 265
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 8)
	.liabs	_c64keys, 8
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//c64keys.c, line 268
						//pcreltotemp
	.lipcrel	l86
	add	r7
l51: # 

						//c64keys.c, line 270
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//c64keys.c, line 270
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// freereg r1
						// allocreg r1

						//c64keys.c, line 272
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 66
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8192
	and	r1
						// (save result) // isreg
						// freereg r1

						//c64keys.c, line 272
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l59
		add	r7
						// allocreg r1

						//c64keys.c, line 273
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16
	sgn
	shr	r3
						// (save result) // isreg
l59: # 

						//c64keys.c, line 274
						// (bitwise/arithmetic) 	//ops: 6, 0, 1
						// (obj to r0) flags 62 type 103
						// deref 
	ld	r5
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	-8193
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x62
	mt	r0
	st	r5

						//c64keys.c, line 277
						//pcreltotemp
	.lipcrel	l65
	add	r7
l57: # 

						//c64keys.c, line 277
						// (test)
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_c64keys, 8
						//extern deref
						//sizemod based on type 0x3
	ldt

						//c64keys.c, line 277
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l65
		add	r7

						//c64keys.c, line 277
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	16
	sgn
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//c64keys.c, line 277
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

						//c64keys.c, line 277
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l65
		add	r7
						// freereg r1
						// allocreg r1

						//c64keys.c, line 280
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_c64keys, 12
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	2048
	and	r1
						// (save result) // isreg
						// freereg r1

						//c64keys.c, line 280
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l64
		add	r7
						// allocreg r1

						//c64keys.c, line 280
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
	mr	r1
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	2048
	and	r1
						// (save result) // isreg
						// freereg r1

						//c64keys.c, line 280
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l65
		add	r7
l64: # 
						// allocreg r1

						//c64keys.c, line 282
						// (bitwise/arithmetic) 	//ops: 6, 0, 1
						// (obj to r0) flags 62 type 103
						// deref 
	ld	r5
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	8192
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x62
	mt	r0
	st	r5

						//c64keys.c, line 283
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 98
						// matchobj comparing flags 2 with 98
						// var, auto|reg
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l65: # 
						// allocreg r1

						//c64keys.c, line 287
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	32768
	and	r1
						// (save result) // isreg
						// freereg r1

						//c64keys.c, line 287
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l69
		add	r7
						// allocreg r1

						//c64keys.c, line 292
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_c64keys, 12
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	768
	and	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l70
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	256
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l71
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l75
		add	r7
						//pcreltotemp
	.lipcrel	l79
	add	r7
						// freereg r1
l70: # 
						// allocreg r1

						//c64keys.c, line 294
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r1
						// (save result) // isreg

						//c64keys.c, line 294
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	mul	r1
						// (save result) // isreg

						//c64keys.c, line 294
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_specialtable
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//c64keys.c, line 294
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 130
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1

						//c64keys.c, line 295
						//pcreltotemp
	.lipcrel	l69
	add	r7
l71: # 
						// allocreg r1

						//c64keys.c, line 297
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r1
						// (save result) // isreg

						//c64keys.c, line 297
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	mul	r1
						// (save result) // isreg

						//c64keys.c, line 297
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_specialtable
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//c64keys.c, line 297
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	1
	add	r1
						// (save result) // isreg

						//c64keys.c, line 297
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1

						//c64keys.c, line 298
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 106
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//c64keys.c, line 298
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l73
		add	r7
						// allocreg r1

						//c64keys.c, line 299
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	32
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	18
						// (save temp)store type 3
	st	r0
						//save_temp done

						//c64keys.c, line 301
						//pcreltotemp
	.lipcrel	l69
	add	r7
l73: # 

						//c64keys.c, line 301
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	28
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	274
						// (save temp)store type 3
	st	r0
						//save_temp done

						//c64keys.c, line 302
						//pcreltotemp
	.lipcrel	l69
	add	r7
						// freereg r1
l75: # 
						// allocreg r1

						//c64keys.c, line 304
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r1
						// (save result) // isreg

						//c64keys.c, line 304
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	mul	r1
						// (save result) // isreg

						//c64keys.c, line 304
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_specialtable
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//c64keys.c, line 304
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	1
	add	r1
						// (save result) // isreg

						//c64keys.c, line 304
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1

						//c64keys.c, line 305
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 106
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//c64keys.c, line 305
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l77
		add	r7
						// allocreg r1

						//c64keys.c, line 306
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	32
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	89
						// (save temp)store type 3
	st	r0
						//save_temp done

						//c64keys.c, line 308
						//pcreltotemp
	.lipcrel	l69
	add	r7
l77: # 

						//c64keys.c, line 308
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	28
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	345
						// (save temp)store type 3
	st	r0
						//save_temp done

						//c64keys.c, line 309
						//pcreltotemp
	.lipcrel	l69
	add	r7
						// freereg r1
l79: # 
						// allocreg r1

						//c64keys.c, line 311
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r1
						// (save result) // isreg

						//c64keys.c, line 311
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	mul	r1
						// (save result) // isreg

						//c64keys.c, line 311
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_specialtable
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//c64keys.c, line 311
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	1
	add	r1
						// (save result) // isreg

						//c64keys.c, line 311
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l69: # 
						// allocreg r1

						//c64keys.c, line 315
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//c64keys.c, line 315
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l81
		add	r7
						// freereg r1
						// allocreg r1

						//c64keys.c, line 317
						//comp
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 66
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// matchobj comparing flags 1 with 66
	.liconst	-1
	xor	r1
						// (save result) // isreg

						//c64keys.c, line 317
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32512
	and	r1
						// (save result) // isreg

						//c64keys.c, line 317
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_c64keys, 12
						//extern deref
						//sizemod based on type 0x3
	ldt
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 12)
	.liabs	_c64keys, 16
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//c64keys.c, line 318
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	255
	and	r3
						// (save result) // isreg

						//c64keys.c, line 319
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	256
	or	r3
						// (save result) // isreg

						//c64keys.c, line 322
						//pcreltotemp
	.lipcrel	l82
	add	r7
l81: # 
						// allocreg r1

						//c64keys.c, line 323
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	32512
	and	r1
						// (save result) // isreg

						//c64keys.c, line 323
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_c64keys, 12
						//extern deref
						//sizemod based on type 0x3
	ldt
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 12)
	.liabs	_c64keys, 16
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//c64keys.c, line 324
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	255
	and	r3
						// (save result) // isreg
l82: # 
						// allocreg r1

						//c64keys.c, line 326
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	28
						//sizemod based on type 0x3
	ldidx	r6

						//c64keys.c, line 326
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l84
		add	r7
						// freereg r1

						//c64keys.c, line 327
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	stdec	r6
						// allocreg r1

						//c64keys.c, line 327
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_c64keys
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 327
						//call
						//pcreltotemp
	.lipcrel	_c64keyboard_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l84: # 

						//c64keys.c, line 328
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6
						// allocreg r1

						//c64keys.c, line 328
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_c64keys
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 328
						//call
						//pcreltotemp
	.lipcrel	_c64keyboard_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//c64keys.c, line 329
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	32
						//sizemod based on type 0x3
	ldidx	r6

						//c64keys.c, line 329
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l86
		add	r7

						//c64keys.c, line 330
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	stdec	r6
						// allocreg r1

						//c64keys.c, line 330
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_c64keys
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//c64keys.c, line 330
						//call
						//pcreltotemp
	.lipcrel	_c64keyboard_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l86: # 
						// allocreg r1

						//c64keys.c, line 333
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	24
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//c64keys.c, line 334
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 62 type 103
						// matchobj comparing flags 98 with 130
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	1
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x62
	mt	r0
	st	r6

						//c64keys.c, line 244
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 98
						// matchobj comparing flags 2 with 98
						// var, auto|reg
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	28
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//c64keys.c, line 244
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	32
	sgn
	cmp	r0

						//c64keys.c, line 244
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l90
		add	r7
						// freereg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 102 type 3
						// matchobj comparing flags 258 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//c64keys.c, line 216
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 258
						// const
						// matchobj comparing flags 1 with 258
	.liconst	1
	add	r4
						// (save result) // isreg

						//c64keys.c, line 216
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	sgn
	cmp	r4

						//c64keys.c, line 216
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l89
		add	r7
						// freereg r1
						// freereg r2
						// freereg r3
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//c64keys.c, line 337
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 4)
	.liabs	_c64keys, 4
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)store type 3
	st	r0
						//save_temp done
l39: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-36
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.data.5
	.align	4
l28:
	.int	0
	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.6
	.global	_initc64keys
_initc64keys:
	stdec	r6
						// allocreg r2

						//c64keys.c, line 344
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
l101: # 
						// allocreg r1

						//c64keys.c, line 345
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	mul	r1
						// (save result) // isreg

						//c64keys.c, line 345
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 16)
	.liabs	_c64keys, 16
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//c64keys.c, line 345
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	-1
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1

						//c64keys.c, line 345
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r2
						// (save result) // isreg

						//c64keys.c, line 345
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	6
	sgn
	cmp	r2

						//c64keys.c, line 345
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l101
		add	r7

						//c64keys.c, line 346
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 4)
	.liabs	_c64keys, 4
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	stinc	r0
						//save_temp done

						//c64keys.c, line 347
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	stinc	r0
						//save_temp done

						//c64keys.c, line 348
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2
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
	.section	.text.7
l104:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1

						//acsi.c, line 46
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	43
	sgn
	cmp	r2

						//acsi.c, line 46
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l153
		add	r7

						//acsi.c, line 46
						//setreturn
						// (obj to r0) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0

						//acsi.c, line 48
						//pcreltotemp
	.lipcrel	l105
	add	r7
l153: # 
						// allocreg r1

						//acsi.c, line 48
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	mul	r1
						// (save result) // isreg

						//acsi.c, line 48
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l107,0
						// static pe is varadr
	add	r1
						// (save result) // isreg

						//acsi.c, line 48
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 6a type a
						// matchobj comparing flags 106 with 130
						// deref 
	ld	r1
	mr	r0
						// freereg r1
l105: # 
						// freereg r2
	ldinc	r6
	mr	r7

	.section	.rodata.8
	.align	4
l108:
	.byte	84
	.byte	101
	.byte	115
	.byte	116
	.byte	32
	.byte	68
	.byte	114
	.byte	105
	.byte	118
	.byte	101
	.byte	32
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	121
	.byte	0
	.section	.rodata.9
	.align	4
l109:
	.byte	82
	.byte	101
	.byte	115
	.byte	116
	.byte	111
	.byte	114
	.byte	101
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	90
	.byte	101
	.byte	114
	.byte	111
	.byte	0
	.section	.rodata.a
	.align	4
l110:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	50
	.byte	0
	.section	.rodata.b
	.align	4
l111:
	.byte	82
	.byte	101
	.byte	113
	.byte	117
	.byte	101
	.byte	115
	.byte	116
	.byte	32
	.byte	83
	.byte	101
	.byte	110
	.byte	115
	.byte	101
	.byte	0
	.section	.rodata.c
	.align	4
l112:
	.byte	70
	.byte	111
	.byte	114
	.byte	109
	.byte	97
	.byte	116
	.byte	32
	.byte	68
	.byte	114
	.byte	105
	.byte	118
	.byte	101
	.byte	0
	.section	.rodata.d
	.align	4
l113:
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	32
	.byte	66
	.byte	108
	.byte	111
	.byte	99
	.byte	107
	.byte	32
	.byte	108
	.byte	105
	.byte	109
	.byte	105
	.byte	116
	.byte	115
	.byte	0
	.section	.rodata.e
	.align	4
l114:
	.byte	82
	.byte	101
	.byte	97
	.byte	115
	.byte	115
	.byte	105
	.byte	103
	.byte	110
	.byte	32
	.byte	66
	.byte	108
	.byte	111
	.byte	99
	.byte	107
	.byte	115
	.byte	0
	.section	.rodata.f
	.align	4
l115:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	55
	.byte	0
	.section	.rodata.10
	.align	4
l116:
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	32
	.byte	83
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	0
	.section	.rodata.11
	.align	4
l117:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	57
	.byte	0
	.section	.rodata.12
	.align	4
l118:
	.byte	87
	.byte	114
	.byte	105
	.byte	116
	.byte	101
	.byte	32
	.byte	83
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	0
	.section	.rodata.13
	.align	4
l119:
	.byte	83
	.byte	101
	.byte	101
	.byte	107
	.byte	32
	.byte	66
	.byte	108
	.byte	111
	.byte	99
	.byte	107
	.byte	0
	.section	.rodata.14
	.align	4
l120:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	67
	.byte	0
	.section	.rodata.15
	.align	4
l121:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	68
	.byte	0
	.section	.rodata.16
	.align	4
l122:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	69
	.byte	0
	.section	.rodata.17
	.align	4
l123:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	70
	.byte	0
	.section	.rodata.18
	.align	4
l124:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	48
	.byte	0
	.section	.rodata.19
	.align	4
l125:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	49
	.byte	0
	.section	.rodata.1a
	.align	4
l126:
	.byte	73
	.byte	110
	.byte	113
	.byte	117
	.byte	105
	.byte	114
	.byte	121
	.byte	0
	.section	.rodata.1b
	.align	4
l127:
	.byte	86
	.byte	101
	.byte	114
	.byte	105
	.byte	102
	.byte	121
	.byte	0
	.section	.rodata.1c
	.align	4
l128:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	52
	.byte	0
	.section	.rodata.1d
	.align	4
l129:
	.byte	77
	.byte	111
	.byte	100
	.byte	101
	.byte	32
	.byte	83
	.byte	101
	.byte	108
	.byte	101
	.byte	99
	.byte	116
	.byte	0
	.section	.rodata.1e
	.align	4
l130:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	54
	.byte	0
	.section	.rodata.1f
	.align	4
l131:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	55
	.byte	0
	.section	.rodata.20
	.align	4
l132:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	56
	.byte	0
	.section	.rodata.21
	.align	4
l133:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	57
	.byte	0
	.section	.rodata.22
	.align	4
l134:
	.byte	77
	.byte	111
	.byte	100
	.byte	101
	.byte	32
	.byte	83
	.byte	101
	.byte	110
	.byte	115
	.byte	101
	.byte	0
	.section	.rodata.23
	.align	4
l135:
	.byte	83
	.byte	116
	.byte	97
	.byte	114
	.byte	116
	.byte	47
	.byte	83
	.byte	116
	.byte	111
	.byte	112
	.byte	32
	.byte	85
	.byte	110
	.byte	105
	.byte	116
	.byte	0
	.section	.rodata.24
	.align	4
l136:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	67
	.byte	0
	.section	.rodata.25
	.align	4
l137:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	68
	.byte	0
	.section	.rodata.26
	.align	4
l138:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	69
	.byte	0
	.section	.rodata.27
	.align	4
l139:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	49
	.byte	70
	.byte	0
	.section	.rodata.28
	.align	4
l140:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	50
	.byte	48
	.byte	0
	.section	.rodata.29
	.align	4
l141:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	50
	.byte	49
	.byte	0
	.section	.rodata.2a
	.align	4
l142:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	50
	.byte	50
	.byte	0
	.section	.rodata.2b
	.align	4
l143:
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	32
	.byte	70
	.byte	111
	.byte	114
	.byte	109
	.byte	97
	.byte	116
	.byte	32
	.byte	67
	.byte	97
	.byte	112
	.byte	97
	.byte	99
	.byte	105
	.byte	116
	.byte	105
	.byte	101
	.byte	115
	.byte	0
	.section	.rodata.2c
	.align	4
l144:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	50
	.byte	52
	.byte	0
	.section	.rodata.2d
	.align	4
l145:
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	32
	.byte	67
	.byte	97
	.byte	112
	.byte	97
	.byte	99
	.byte	105
	.byte	116
	.byte	121
	.byte	32
	.byte	40
	.byte	49
	.byte	48
	.byte	41
	.byte	0
	.section	.rodata.2e
	.align	4
l146:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	50
	.byte	54
	.byte	0
	.section	.rodata.2f
	.align	4
l147:
	.byte	67
	.byte	109
	.byte	100
	.byte	32
	.byte	36
	.byte	50
	.byte	55
	.byte	0
	.section	.rodata.30
	.align	4
l148:
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	32
	.byte	40
	.byte	49
	.byte	48
	.byte	41
	.byte	0
	.section	.rodata.31
	.align	4
l149:
	.byte	82
	.byte	101
	.byte	97
	.byte	100
	.byte	32
	.byte	71
	.byte	101
	.byte	110
	.byte	101
	.byte	114
	.byte	97
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	0
	.section	.rodata.32
	.align	4
l150:
	.byte	87
	.byte	114
	.byte	105
	.byte	116
	.byte	101
	.byte	32
	.byte	40
	.byte	49
	.byte	48
	.byte	41
	.byte	0
	.section	.rodata.33
	.align	4
l151:
	.byte	83
	.byte	101
	.byte	101
	.byte	107
	.byte	32
	.byte	40
	.byte	49
	.byte	48
	.byte	41
	.byte	0
	.section	.data.34
	.align	4
l107:
						// Declaring from tree
						// static
	.ref	l108
						// Declaring from tree
						// static
	.ref	l109
						// Declaring from tree
						// static
	.ref	l110
						// Declaring from tree
						// static
	.ref	l111
						// Declaring from tree
						// static
	.ref	l112
						// Declaring from tree
						// static
	.ref	l113
						// Declaring from tree
						// static
	.ref	l114
						// Declaring from tree
						// static
	.ref	l115
						// Declaring from tree
						// static
	.ref	l116
						// Declaring from tree
						// static
	.ref	l117
						// Declaring from tree
						// static
	.ref	l118
						// Declaring from tree
						// static
	.ref	l119
						// Declaring from tree
						// static
	.ref	l120
						// Declaring from tree
						// static
	.ref	l121
						// Declaring from tree
						// static
	.ref	l122
						// Declaring from tree
						// static
	.ref	l123
						// Declaring from tree
						// static
	.ref	l124
						// Declaring from tree
						// static
	.ref	l125
						// Declaring from tree
						// static
	.ref	l126
						// Declaring from tree
						// static
	.ref	l127
						// Declaring from tree
						// static
	.ref	l128
						// Declaring from tree
						// static
	.ref	l129
						// Declaring from tree
						// static
	.ref	l130
						// Declaring from tree
						// static
	.ref	l131
						// Declaring from tree
						// static
	.ref	l132
						// Declaring from tree
						// static
	.ref	l133
						// Declaring from tree
						// static
	.ref	l134
						// Declaring from tree
						// static
	.ref	l135
						// Declaring from tree
						// static
	.ref	l136
						// Declaring from tree
						// static
	.ref	l137
						// Declaring from tree
						// static
	.ref	l138
						// Declaring from tree
						// static
	.ref	l139
						// Declaring from tree
						// static
	.ref	l140
						// Declaring from tree
						// static
	.ref	l141
						// Declaring from tree
						// static
	.ref	l142
						// Declaring from tree
						// static
	.ref	l143
						// Declaring from tree
						// static
	.ref	l144
						// Declaring from tree
						// static
	.ref	l145
						// Declaring from tree
						// static
	.ref	l146
						// Declaring from tree
						// static
	.ref	l147
						// Declaring from tree
						// static
	.ref	l148
						// Declaring from tree
						// static
	.ref	l149
						// Declaring from tree
						// static
	.ref	l150
						// Declaring from tree
						// static
	.ref	l151
	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.35
l154:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 104
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r3

						//acsi.c, line 55
						// (test)
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	12
	ldidx	r6

						//acsi.c, line 55
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l158
		add	r7

						//acsi.c, line 55
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16777216
						// (save temp)isreg
	mr	r3
						//save_temp done

						//acsi.c, line 55
						//pcreltotemp
	.lipcrel	l159
	add	r7
l158: # 

						//acsi.c, line 55
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done
l159: # 

						//acsi.c, line 55
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 4, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 104
						// reg r3 - only match against tmp
	mt	r3
	or	r2
						// (save result) // isreg

						//acsi.c, line 56
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	shr	r2
						// (save result) // isreg

						//acsi.c, line 58
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 59
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 60
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	8
	ldidx	r6
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 2
						// matchobj comparing flags 161 with 2
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// allocreg r1

						//acsi.c, line 61
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 104
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	16
	shr	r1
						// (save result) // isreg

						//acsi.c, line 61
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1
						// allocreg r1

						//acsi.c, line 62
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 104
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shr	r1
						// (save result) // isreg

						//acsi.c, line 62
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1

						//acsi.c, line 63
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 1
						// (obj to r0) flags 42 type 104
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness

						//acsi.c, line 64
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2
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
	.section	.text.36
l160:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 104
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1

						//acsi.c, line 68
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 64
						// deref
						// const to r0
						// matchobj comparing flags 1 with 64
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 69
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//acsi.c, line 70
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 104
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	24
	shr	r1
						// (save result) // isreg

						//acsi.c, line 70
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1
						// allocreg r1

						//acsi.c, line 71
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 104
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	16
	shr	r1
						// (save result) // isreg

						//acsi.c, line 71
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1
						// allocreg r1

						//acsi.c, line 72
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 104
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shr	r1
						// (save result) // isreg

						//acsi.c, line 72
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1

						//acsi.c, line 73
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 1
						// (obj to r0) flags 42 type 104
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness

						//acsi.c, line 74
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
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
	.section	.text.37
l163:
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
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 102 type 104
						// matchobj comparing flags 258 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	12
	ldidx	r6
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 258
						// const
						// matchobj comparing flags 1 with 258
	.liconst	-44
						// (save temp)isreg
	mr	r3
						//save_temp done

						//acsi.c, line 78
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 79
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	3
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r1

						//acsi.c, line 82
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 82
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r4
						// (save result) // isreg

						//acsi.c, line 82
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//acsi.c, line 82
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l170
		add	r7
l169: # 

						//acsi.c, line 83
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	0
						// (save temp)store type 3
	st	r3
						//save_temp done

						//acsi.c, line 83
						//FIXME convert
						// (convert - reducing type 503 to 101
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r2
						//save_temp done

						//acsi.c, line 84
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	0
						// (save temp)store type 3
	st	r3
						//save_temp done

						//acsi.c, line 84
						//FIXME convert
						// (convert - reducing type 503 to 101
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r2
						//save_temp done
						// allocreg r1

						//acsi.c, line 82
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 608
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 82
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	sub	r4
						// (save result) // isreg

						//acsi.c, line 82
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//acsi.c, line 82
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l169
		add	r7
l170: # 

						//acsi.c, line 87
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
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
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.38
l171:
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
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	-44
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 102 type 104
						// matchobj comparing flags 258 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	ldidx	r6
						// (save temp)isreg
	mr	r3
						//save_temp done

						//acsi.c, line 97
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 258
						// deref
						// const to r0
						// matchobj comparing flags 1 with 258
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 98
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	2
						// (save temp)store type 3
	st	r4
						//save_temp done
						// allocreg r1

						//acsi.c, line 100
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 100
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r3
						// (save result) // isreg

						//acsi.c, line 100
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//acsi.c, line 100
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l178
		add	r7
l177: # 

						//acsi.c, line 101
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 6a type 101
						// deref 
	ldbinc	r2
						// (save temp)store type 3
	st	r4
						//save_temp done

						//acsi.c, line 102
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 106
						// deref 
	ldbinc	r2
						// (save temp)store type 3
	st	r4
						//save_temp done
						// allocreg r1

						//acsi.c, line 100
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 106
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 100
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	sub	r3
						// (save result) // isreg

						//acsi.c, line 100
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//acsi.c, line 100
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l177
		add	r7
l178: # 

						//acsi.c, line 105
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
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
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.39
l179:
	stdec	r6
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

						//acsi.c, line 111
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 64
						// deref
						// const to r0
						// matchobj comparing flags 1 with 64
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 112
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 114
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	512
	stdec	r6
						// allocreg r1

						//acsi.c, line 114
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 114
						//call
						//pcreltotemp
	.lipcrel	_spi_read
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//acsi.c, line 116
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-4
	sub	r6
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
	.section	.text.3a
l182:
	stdec	r6
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

						//acsi.c, line 121
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 64
						// deref
						// const to r0
						// matchobj comparing flags 1 with 64
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 122
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	2
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 124
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	512
	stdec	r6
						// allocreg r1

						//acsi.c, line 124
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 124
						//call
						//pcreltotemp
	.lipcrel	_spi_write
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//acsi.c, line 126
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-4
	sub	r6
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
	.section	.text.3b
	.global	_mist_memory_set
_mist_memory_set:
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
						// (obj to tmp) flags 40 type 101
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	-44
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 102 type 104
						// matchobj comparing flags 258 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	ldidx	r6
						// (save temp)isreg
	mr	r3
						//save_temp done

						//acsi.c, line 130
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 258
						// deref
						// const to r0
						// matchobj comparing flags 1 with 258
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 131
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	2
						// (save temp)store type 3
	st	r4
						//save_temp done
						// allocreg r1

						//acsi.c, line 133
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 133
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r3
						// (save result) // isreg

						//acsi.c, line 133
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//acsi.c, line 133
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l191
		add	r7
l190: # 

						//acsi.c, line 134
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 42 type 101
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r4
						//save_temp done

						//acsi.c, line 135
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 66
						// reg r2 - only match against tmp
						// (save temp)store type 3
	st	r4
						//save_temp done
						// allocreg r1

						//acsi.c, line 133
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 66
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 133
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	sub	r3
						// (save result) // isreg

						//acsi.c, line 133
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//acsi.c, line 133
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l190
		add	r7
l191: # 

						//acsi.c, line 138
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
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
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3c
l192:
	stdec	r6
						// allocreg r1

						//acsi.c, line 143
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 144
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	6
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 145
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 42 type 101
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 66
						// matchobj comparing flags 161 with 66
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness

						//acsi.c, line 146
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
	ldinc	r6
	mr	r7

	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3d
l195:
	stdec	r6

						//acsi.c, line 150
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 151
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	10
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 152
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
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
	.section	.text.3e
	.global	_handle_acsi
_handle_acsi:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-44
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
						// allocreg r1

						//acsi.c, line 157
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 64
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	10
	add	r1
						// (save result) // isreg

						//acsi.c, line 157
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	byt
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 157
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	//mt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	5
	sgn
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
						// allocreg r1

						//acsi.c, line 158
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 130
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r1
						// (save result) // isreg

						//acsi.c, line 158
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// matchobj comparing flags 106 with 2
						// deref 
	byt
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 158
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	//mt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	5
	sgn
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	24
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//acsi.c, line 159
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 22 type 101
						// matchobj comparing flags 34 with 130
						// matchobj comparing flags 34 with 2
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 130
						// matchobj comparing flags 162 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x101
	byt
	ldt
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 34
						// matchobj comparing flags 1 with 34
	.liconst	28
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//acsi.c, line 161
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	31
	and	r1
						// (save result) // isreg

						//acsi.c, line 161
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	65536
	mul	r1
						// (save result) // isreg
						// allocreg r2

						//acsi.c, line 161
						// (bitwise/arithmetic) 	//ops: 7, 0, 3
						// (obj to r2) flags 62 type a
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 2
	.liconst	2
	add	r2
						// (save result) // isreg

						//acsi.c, line 161
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// matchobj comparing flags 106 with 2
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	32
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2
						// allocreg r2

						//acsi.c, line 161
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
	mr	r2
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	256
	mul	r2
						// (save result) // isreg

						//acsi.c, line 161
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// matchobj comparing flags 74 with 74
						// Obsoleting t1
						// freereg r2
						// allocreg r2

						//acsi.c, line 161
						// (bitwise/arithmetic) 	//ops: 7, 0, 3
						// (obj to r2) flags 62 type a
						// matchobj comparing flags 98 with 74
						// deref 
	ld	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	3
	add	r2
						// (save result) // isreg

						//acsi.c, line 161
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2

						//acsi.c, line 161
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
	add	r1
						// (save result) // isreg

						//acsi.c, line 161
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	40
	addt	r6
						//sizemod based on type 0x103
	stmpdec	r1
						// freereg r1

						//acsi.c, line 162
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 62 type a
						// matchobj comparing flags 98 with 130
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
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

						//acsi.c, line 162
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r4)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 22 type 101
						// matchobj comparing flags 34 with 130
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 130
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 130
	.liconst	4
	ldidx	r6
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r4
						//save_temp done

						//acsi.c, line 163
						// (test)
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 34
						// reg r4 - only match against tmp
	//mt
				// flags 42
	and	r4

						//acsi.c, line 163
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l202
		add	r7
						// allocreg r2
						// allocreg r1

						//acsi.c, line 163
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	256
						// (save temp)isreg
	mr	r4
						//save_temp done
l202: # 

						//acsi.c, line 174
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	16
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	sgn
	cmp	r0

						//acsi.c, line 174
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l204
		add	r7
						// freereg r1
						// allocreg r1

						//acsi.c, line 174
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	72
	mul	r1
						// (save result) // isreg

						//acsi.c, line 174
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 82 type a
						// (prepobj r0)
 						// extern (offset 144)
	.liabs	_diskimg, 144
						// extern pe is varadr
	mr	r0
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
						// freereg r1

						//acsi.c, line 174
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	12
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
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching

						//acsi.c, line 174
						// (test)
						// (obj to tmp) flags 22 type 103
						// matchobj comparing flags 34 with 130
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 130
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 130
	.liconst	8
	ldidx	r6
						//sizemod based on type 0x103
	ldt

						//acsi.c, line 174
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l204
		add	r7
						// allocreg r1

						//acsi.c, line 176
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 22 type 103
						// matchobj comparing flags 34 with 34

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 34
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
						// matchobj comparing flags 1 with 34
	.liconst	9
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	44
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l211
		add	r7
						// (bitwise/arithmetic) 	//ops: 0, 0, 6
						// (obj to r5) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r5
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	3
	sub	r5
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l216
		add	r7
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r5
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l211
		add	r7
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	4
	sub	r5
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l221
		add	r7
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	2
	sub	r5
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l234
		add	r7
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	8
	sub	r5
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l247
		add	r7
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r5
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l254
		add	r7
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	11
	sub	r5
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l207
		add	r7
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	3
	sub	r5
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l221
		add	r7
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	2
	sub	r5
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l234
		add	r7
						//pcreltotemp
	.lipcrel	l258
	add	r7
l207: # 

						//acsi.c, line 181
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6

						//acsi.c, line 181
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l209
		add	r7
						// freereg r1
						// freereg r2
						// freereg r3
						// allocreg r3

						//acsi.c, line 182
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//acsi.c, line 182
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//acsi.c, line 182
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	512
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 182
						//call
						//pcreltotemp
	.lipcrel	___memset
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r3
						// freereg r2
						// freereg r1
						// allocreg r1

						//acsi.c, line 183
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// var, auto|reg
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r1
						// (save result) // isreg
						// allocreg r2

						//acsi.c, line 183
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	24
	shr	r2
						// (save result) // isreg

						//acsi.c, line 183
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer, 4
						// extern pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r2
						// freereg r2
						// allocreg r2

						//acsi.c, line 184
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	16
	shr	r2
						// (save result) // isreg

						//acsi.c, line 184
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj tmp)
 						// extern (offset 1)
	.liabs	_sector_buffer, 5
						// extern pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r2
						// freereg r2
						// allocreg r2

						//acsi.c, line 185
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
	shr	r2
						// (save result) // isreg

						//acsi.c, line 185
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj tmp)
 						// extern (offset 2)
	.liabs	_sector_buffer, 6
						// extern pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r2
						// freereg r2

						//acsi.c, line 186
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj tmp)
 						// extern (offset 3)
	.liabs	_sector_buffer, 7
						// extern pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r1
						// freereg r1

						//acsi.c, line 187
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 6 with 3
						// Fuzzy match found against tmp.
	mr	r0
	.liconst	3
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	2
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//acsi.c, line 189
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	4
	stdec	r6
						// allocreg r1

						//acsi.c, line 189
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 7
						//Fuzzy match found, offset: -7 (varadr: 0)
	.liconst	-7
	addt	r0

			// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 189
						//call
						//pcreltotemp
	.lipcrel	l171
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//acsi.c, line 191
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 191
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//acsi.c, line 192
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 192
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//acsi.c, line 193
						//pcreltotemp
	.lipcrel	l259
	add	r7
l209: # 
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//acsi.c, line 194
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 194
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//acsi.c, line 195
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 195
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	37
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//acsi.c, line 197
						//pcreltotemp
	.lipcrel	l259
	add	r7
l211: # 
						// allocreg r1

						//acsi.c, line 201
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6

						//acsi.c, line 201
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l214
		add	r7
						// freereg r1
						// allocreg r1

						//acsi.c, line 202
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj r1)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 202
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//acsi.c, line 203
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 203
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//acsi.c, line 204
						//pcreltotemp
	.lipcrel	l259
	add	r7
l214: # 
						// allocreg r1

						//acsi.c, line 205
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 205
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	37
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//acsi.c, line 206
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 206
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//acsi.c, line 208
						//pcreltotemp
	.lipcrel	l259
	add	r7
l216: # 
						// allocreg r1

						//acsi.c, line 211
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6

						//acsi.c, line 211
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l218
		add	r7
						// freereg r1
						// allocreg r1

						//acsi.c, line 212
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj r1)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 212
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	37
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// freereg r2
						// freereg r3
l218: # 
						// allocreg r3

						//acsi.c, line 214
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//acsi.c, line 214
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//acsi.c, line 214
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	512
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 214
						//call
						//pcreltotemp
	.lipcrel	___memset
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//acsi.c, line 215
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 7)
	.liabs	_sector_buffer, 7
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	11
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//acsi.c, line 216
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r0
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching
						// allocreg r1

						//acsi.c, line 216
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 22 type 101
						// matchobj comparing flags 34 with 98
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 98
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 216
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 34
						// reg r1 - only match against tmp
	//mt
				// flags 4a
	and	r1
						// freereg r1

						//acsi.c, line 216
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l220
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//acsi.c, line 217
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// extern (offset 2)
	.liabs	_sector_buffer, 2
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	5
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//acsi.c, line 218
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 12 with 3
						//Fuzzy match found, offset: 9 (varadr: 1)
	.liconst	9
	add	r0

						// required value found in r0
						// (obj to tmp) flags 22 type 101
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
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
l220: # 

						//acsi.c, line 220
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	9
	stdec	r6
						// allocreg r1

						//acsi.c, line 220
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 220
						//call
						//pcreltotemp
	.lipcrel	l171
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//acsi.c, line 221
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 221
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//acsi.c, line 222
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 101
						// const
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//acsi.c, line 223
						//pcreltotemp
	.lipcrel	l259
	add	r7
l221: # 
						// allocreg r1

						//acsi.c, line 227
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6

						//acsi.c, line 227
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l224
		add	r7

						//acsi.c, line 228
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	40
	cmp	r0

						//acsi.c, line 228
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l226
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r1

						//acsi.c, line 233
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	28
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16777216
	mul	r1
						// (save result) // isreg
						// allocreg r2

						//acsi.c, line 233
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 3
						// var, auto|reg
	.liconst	32
						//sizemod based on type 0x3
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	65536
	mul	r2
						// (save result) // isreg

						//acsi.c, line 233
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//acsi.c, line 233
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 22 type 101
						// matchobj comparing flags 34 with 74
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 74
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 74
	.liconst	4
	ldidx	r6
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//acsi.c, line 233
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	256
	mul	r2
						// (save result) // isreg

						//acsi.c, line 233
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//acsi.c, line 233
						// (bitwise/arithmetic) 	//ops: 7, 0, 3
						// (obj to r2) flags 62 type a
						// matchobj comparing flags 98 with 74
						// deref 
	ld	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	5
	add	r2
						// (save result) // isreg

						//acsi.c, line 233
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	byt
	ld	r2
						// (save temp)isreg
	mr	r2
						//save_temp done

						//acsi.c, line 233
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 106
						// var, auto|reg
						// matchobj comparing flags 1 with 106
	.liconst	36
	addt	r6
	mr	r0

						// (obj to tmp) flags 4a type 3
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
						// allocreg r1

						//acsi.c, line 235
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	7
	add	r1
						// (save result) // isreg

						//acsi.c, line 235
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	byt
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 235
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	256
	mul	r1
						// (save result) // isreg
						// allocreg r2

						//acsi.c, line 235
						// (bitwise/arithmetic) 	//ops: 7, 0, 3
						// (obj to r2) flags 62 type a
						// deref 
	ld	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	8
	add	r2
						// (save result) // isreg

						//acsi.c, line 235
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	byt
	ld	r2
						// (save temp)isreg
	mr	r2
						//save_temp done

						//acsi.c, line 235
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 5
						//Special case - addt
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	//mt
	addt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r2
						// freereg r1
l226: # 
						// allocreg r2
						// allocreg r1

						//acsi.c, line 239
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	36
						//sizemod based on type 0x103
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 239
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r1
						// freereg r1

						//acsi.c, line 239
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l228
		add	r7
						// allocreg r1

						//acsi.c, line 242
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	36
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	9
	shl	r1
						// (save result) // isreg

						//acsi.c, line 242
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//acsi.c, line 242
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 242
						//call
						//pcreltotemp
	.lipcrel	_FileSeek
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//acsi.c, line 243
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 243
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	sub	r4
						// (save result) // isreg

						//acsi.c, line 243
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//acsi.c, line 243
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l262
		add	r7
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 102 type a
						// matchobj comparing flags 258 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	12
						//sizemod based on type 0xa
	ldidx	r6
						// (save temp)isreg
	mr	r5
						//save_temp done
l229: # 

						//acsi.c, line 245
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type a
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//acsi.c, line 245
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 245
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//acsi.c, line 246
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	stdec	r6
						// allocreg r1

						//acsi.c, line 246
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 246
						//call
						//pcreltotemp
	.lipcrel	_FileNextSector
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//acsi.c, line 243
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 243
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	sub	r4
						// (save result) // isreg

						//acsi.c, line 243
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//acsi.c, line 243
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l229
		add	r7
l262: # 
						// allocreg r1

						//acsi.c, line 249
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 249
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//acsi.c, line 250
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 250
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//acsi.c, line 251
						//pcreltotemp
	.lipcrel	l259
	add	r7
l228: # 
						// allocreg r1

						//acsi.c, line 257
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 257
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//acsi.c, line 258
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 258
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	33
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//acsi.c, line 260
						//pcreltotemp
	.lipcrel	l259
	add	r7
l224: # 
						// allocreg r1

						//acsi.c, line 261
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 261
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//acsi.c, line 262
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 262
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	37
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//acsi.c, line 264
						//pcreltotemp
	.lipcrel	l259
	add	r7
l234: # 
						// allocreg r1

						//acsi.c, line 268
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6

						//acsi.c, line 268
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l237
		add	r7

						//acsi.c, line 269
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	42
	cmp	r0

						//acsi.c, line 269
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l239
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r1

						//acsi.c, line 274
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	28
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16777216
	mul	r1
						// (save result) // isreg
						// allocreg r2

						//acsi.c, line 274
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 3
						// var, auto|reg
	.liconst	32
						//sizemod based on type 0x3
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	65536
	mul	r2
						// (save result) // isreg

						//acsi.c, line 274
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//acsi.c, line 274
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 22 type 101
						// matchobj comparing flags 34 with 74
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 74
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 74
	.liconst	4
	ldidx	r6
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//acsi.c, line 274
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	256
	mul	r2
						// (save result) // isreg

						//acsi.c, line 274
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2
						// allocreg r2

						//acsi.c, line 274
						// (bitwise/arithmetic) 	//ops: 7, 0, 3
						// (obj to r2) flags 62 type a
						// matchobj comparing flags 98 with 74
						// deref 
	ld	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	5
	add	r2
						// (save result) // isreg

						//acsi.c, line 274
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	byt
	ld	r2
						// (save temp)isreg
	mr	r2
						//save_temp done

						//acsi.c, line 274
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 106
						// var, auto|reg
						// matchobj comparing flags 1 with 106
	.liconst	36
	addt	r6
	mr	r0

						// (obj to tmp) flags 4a type 3
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
						// allocreg r1

						//acsi.c, line 276
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	7
	add	r1
						// (save result) // isreg

						//acsi.c, line 276
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	byt
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 276
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	256
	mul	r1
						// (save result) // isreg
						// allocreg r2

						//acsi.c, line 276
						// (bitwise/arithmetic) 	//ops: 7, 0, 3
						// (obj to r2) flags 62 type a
						// deref 
	ld	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	8
	add	r2
						// (save result) // isreg

						//acsi.c, line 276
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	byt
	ld	r2
						// (save temp)isreg
	mr	r2
						//save_temp done

						//acsi.c, line 276
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 5
						//Special case - addt
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	//mt
	addt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r2
						// freereg r1
l239: # 
						// allocreg r2
						// allocreg r1

						//acsi.c, line 279
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	36
						//sizemod based on type 0x103
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 279
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r1
						// freereg r1

						//acsi.c, line 279
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l241
		add	r7
						// allocreg r1

						//acsi.c, line 281
						// (test)
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//acsi.c, line 281
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l263
		add	r7
						// freereg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 102 type a
						// matchobj comparing flags 258 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	12
						//sizemod based on type 0xa
	ldidx	r6
						// (save temp)isreg
	mr	r5
						//save_temp done
l242: # 
						// allocreg r1

						//acsi.c, line 282
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// var, auto|reg
	.liconst	36
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	9
	shl	r1
						// (save result) // isreg

						//acsi.c, line 282
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//acsi.c, line 282
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 74
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 282
						//call
						//pcreltotemp
	.lipcrel	_FileSeek
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r1

						//acsi.c, line 283
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 283
						//call
						//pcreltotemp
	.lipcrel	l179
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r1

						//acsi.c, line 284
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//acsi.c, line 284
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 284
						//call
						//pcreltotemp
	.lipcrel	_FileWriteSector
	add	r7
						// Deferred popping of 4 bytes (8 in total)
						// freereg r1

						//acsi.c, line 285
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	stdec	r6
						// allocreg r1

						//acsi.c, line 285
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 285
						//call
						//pcreltotemp
	.lipcrel	_FileNextSector
	add	r7
						// Flow control - popping 4 + 8 bytes
	.liconst	12
	add	r6
						// freereg r1

						//acsi.c, line 286
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//acsi.c, line 287
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r4
						// (save result) // isreg

						//acsi.c, line 281
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l242
		add	r7
l263: # 
						// allocreg r1

						//acsi.c, line 290
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 290
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//acsi.c, line 291
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 291
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//acsi.c, line 292
						//pcreltotemp
	.lipcrel	l259
	add	r7
l241: # 
						// allocreg r1

						//acsi.c, line 298
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 298
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//acsi.c, line 299
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 299
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	33
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//acsi.c, line 301
						//pcreltotemp
	.lipcrel	l259
	add	r7
l237: # 
						// allocreg r1

						//acsi.c, line 302
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 302
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//acsi.c, line 303
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 303
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	37
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//acsi.c, line 305
						//pcreltotemp
	.lipcrel	l259
	add	r7
						// freereg r2
						// freereg r3
l247: # 
						// allocreg r3

						//acsi.c, line 309
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//acsi.c, line 309
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//acsi.c, line 309
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	512
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 309
						//call
						//pcreltotemp
	.lipcrel	___memset
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//acsi.c, line 310
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 2)
	.liabs	_sector_buffer, 2
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	2
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//acsi.c, line 311
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
	.liconst	5
	sub	r1
						// (save result) // isreg

						//acsi.c, line 311
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj tmp)
 						// extern (offset 4)
	.liabs	_sector_buffer, 8
						// extern pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r1
						// freereg r1

						//acsi.c, line 312
						// (a/p assign)
					// (char with size!=1 -> array of unknown type)
						// (obj to r0) flags 2 type b
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l248,0
	mr	r0
						// (prepobj r1)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// extern (offset 8)
	.liabs	_sector_buffer, 8
						// extern pe not varadr
	mr	r1
					// Copying 2 words and 0 bytes to sector_buffer
					// Copying 2 words to sector_buffer
	ldinc	r0
	stinc	r1
	ldinc	r0
	stinc	r1

						//acsi.c, line 313
						// (a/p assign)
					// (char with size!=1 -> array of unknown type)
						// (obj to r0) flags 2 type b
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l249,0
	mr	r0
						// (prepobj r1)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// extern (offset 16)
	.liabs	_sector_buffer, 16
						// extern pe not varadr
	mr	r1
					// Copying 4 words and 0 bytes to sector_buffer
					// Copying 4 words to sector_buffer
	ldinc	r0
	stinc	r1
	ldinc	r0
	stinc	r1
	ldinc	r0
	stinc	r1
	ldinc	r0
	stinc	r1
						// allocreg r1

						//acsi.c, line 314
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	16
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	48
	add	r1
						// (save result) // isreg

						//acsi.c, line 314
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// extern (offset 30)
	.liabs	_sector_buffer, 34
						// extern pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r1
						// freereg r1

						//acsi.c, line 315
						// (a/p assign)
					// (char with size!=1 -> array of unknown type)
						// (obj to r0) flags 2 type b
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l250,0
	mr	r0
						// (prepobj r1)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// extern (offset 32)
	.liabs	_sector_buffer, 32
						// extern pe not varadr
	mr	r1
					// Copying 1 words and 0 bytes to sector_buffer
					// Copying 1 words to sector_buffer
	ldinc	r0
	stinc	r1

						//acsi.c, line 316
						// (a/p assign)
					// (char with size!=1 -> array of unknown type)
						// (obj to r0) flags 2 type b
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l251,0
	mr	r0
						// (prepobj r1)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// extern (offset 36)
	.liabs	_sector_buffer, 36
						// extern pe not varadr
	mr	r1
					// Copying 2 words and 0 bytes to sector_buffer
					// Copying 2 words to sector_buffer
	ldinc	r0
	stinc	r1
	ldinc	r0
	stinc	r1

						//acsi.c, line 317
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6

						//acsi.c, line 317
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l253
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//acsi.c, line 317
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	127
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
l253: # 
						// allocreg r1

						//acsi.c, line 318
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	shr	r1
						// (save result) // isreg

						//acsi.c, line 318
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//acsi.c, line 318
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 318
						//call
						//pcreltotemp
	.lipcrel	l171
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//acsi.c, line 319
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 319
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//acsi.c, line 320
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 320
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//acsi.c, line 321
						//pcreltotemp
	.lipcrel	l259
	add	r7
l254: # 
						// allocreg r1

						//acsi.c, line 324
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x3
	ldidx	r6

						//acsi.c, line 324
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l256
		add	r7
						// freereg r1
						// freereg r2
						// freereg r3
						// allocreg r3

						//acsi.c, line 326
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//acsi.c, line 326
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//acsi.c, line 326
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	512
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 326
						//call
						//pcreltotemp
	.lipcrel	___memset
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r3
						// freereg r2
						// freereg r1

						//acsi.c, line 327
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 3)
	.liabs	_sector_buffer, 3
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	8
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//acsi.c, line 328
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	16
	shr	r1
						// (save result) // isreg

						//acsi.c, line 328
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj tmp)
 						// extern (offset 5)
	.liabs	_sector_buffer, 9
						// extern pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r1
						// freereg r1
						// allocreg r1

						//acsi.c, line 329
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	8
	shr	r1
						// (save result) // isreg

						//acsi.c, line 329
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj tmp)
 						// extern (offset 6)
	.liabs	_sector_buffer, 10
						// extern pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r1
						// freereg r1

						//acsi.c, line 330
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 7 with 6
						// Fuzzy match found against tmp.
	mr	r0
	.liconst	1
	add	r0

						// required value found in r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//acsi.c, line 331
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						//extern: comparing 10 with 8
						//Fuzzy match found, offset: 2 (varadr: 1)
	.liconst	2
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//acsi.c, line 332
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
	.liconst	1
	shr	r1
						// (save result) // isreg

						//acsi.c, line 332
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//acsi.c, line 332
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 11
						//Fuzzy match found, offset: -11 (varadr: 0)
	.liconst	-11
	addt	r0

			// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 332
						//call
						//pcreltotemp
	.lipcrel	l171
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//acsi.c, line 333
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 333
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//acsi.c, line 334
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 334
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//acsi.c, line 335
						//pcreltotemp
	.lipcrel	l259
	add	r7
l256: # 
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//acsi.c, line 336
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 336
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	37
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//acsi.c, line 337
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 337
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//acsi.c, line 339
						//pcreltotemp
	.lipcrel	l259
	add	r7
l258: # 
						// allocreg r1

						//acsi.c, line 352
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// static
	.liabs	l200,0
						// static pe is varadr
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	16
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//acsi.c, line 352
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	32
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//acsi.c, line 353
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 353
						//call
						//pcreltotemp
	.lipcrel	l192
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//acsi.c, line 356
						//pcreltotemp
	.lipcrel	l259
	add	r7
l204: # 
						// allocreg r1

						//acsi.c, line 363
						//call
						//pcreltotemp
	.lipcrel	l195
	add	r7
						// Flow control - popping 0 + 0 bytes
l259: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-44
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.rodata.3f
	.align	4
l248:
	.byte	84
	.byte	67
	.byte	54
	.byte	52
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.section	.rodata.40
	.align	4
l249:
	.byte	68
	.byte	101
	.byte	77
	.byte	105
	.byte	83
	.byte	84
	.byte	105
	.byte	102
	.byte	121
	.byte	32
	.byte	72
	.byte	68
	.byte	68
	.byte	32
	.byte	48
	.byte	32
	.byte	0
	.section	.rodata.41
	.align	4
l250:
	.byte	56
	.byte	51
	.byte	50
	.byte	32
	.byte	0
	.section	.rodata.42
	.align	4
l251:
	.byte	50
	.byte	48
	.byte	49
	.byte	50
	.byte	48
	.byte	57
	.byte	50
	.byte	57
	.byte	9
	.byte	0
	.section	.data.43
	.align	4
l200:
	.byte	0
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.44
	.global	_mist_get_dmastate
_mist_get_dmastate:
	stdec	r6
	mt	r3
	stdec	r6
	.liconst	-32
	add	r6
						// allocreg r3

						//acsi.c, line 374
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 375
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	5
						// (save temp)store type 3
	st	r0
						//save_temp done

						//acsi.c, line 376
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	16
	stdec	r6

						//acsi.c, line 376
						// (address)
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//acsi.c, line 376
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 376
						//call
						//pcreltotemp
	.lipcrel	_spi_read
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 1
	.liconst	4
	add	r6
						// freereg r1

						//acsi.c, line 377
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//acsi.c, line 380
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	10
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 380
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
	.liconst	1
	and	r1
						// (save result) // isreg
						// freereg r1

						//acsi.c, line 380
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l267
		add	r7
						// allocreg r1

						//acsi.c, line 382
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//acsi.c, line 382
						//call
						//pcreltotemp
	.lipcrel	_handle_acsi
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l267: # 
						// allocreg r1
						// freereg r1
						// freereg r3
	.liconst	-32
	sub	r6
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
	.section	.text.45
l268:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r5
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
						// allocreg r4
						// allocreg r3

						//acsi.c, line 389
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//acsi.c, line 392
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r3
						//save_temp done
l275: # 
						// allocreg r1

						//acsi.c, line 393
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 104
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//acsi.c, line 393
						// (bitwise/arithmetic) 	//ops: 6, 0, 3
						// (obj to r2) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	mr	r2
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	16
	ldidx	r6
	add	r2
						// (save result) // isreg

						//acsi.c, line 393
						// (bitwise/arithmetic) 	//ops: 3, 4, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	add	r2
						// (save result) // isreg

						//acsi.c, line 393
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 66
						// deref 
	byt
	ld	r2
						// (save temp)isreg
	mr	r2
						//save_temp done

						//acsi.c, line 393
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 5
						//Special case - addt
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	//mt
	addt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r2
						// freereg r1

						//acsi.c, line 393
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	add	r3
						// (save result) // isreg

						//acsi.c, line 393
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4
	sgn
	cmp	r3

						//acsi.c, line 393
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l275
		add	r7

						//acsi.c, line 395
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 104
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
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
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.46
	.global	_sendstatus
_sendstatus:
	stdec	r6
						// allocreg r2
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// const
	.liconst	-44
						// (save temp)isreg
	mr	r2
						//save_temp done

						//overrides.c, line 53
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 4)
	.liabs	_configfile_data, 4
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//overrides.c, line 54
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	255
						// (save temp)store type 3
	st	r2
						//save_temp done

						//overrides.c, line 55
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 130
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	5
						// (save temp)store type 3
	st	r0
						//save_temp done

						//overrides.c, line 56
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r2
						//save_temp done
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 57
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	//mt
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	24
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x260
	mt	r0
	st	r2

						//overrides.c, line 58
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	16
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x260
	mt	r0
	st	r2

						//overrides.c, line 59
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	8
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x260
	mt	r0
	st	r2
						// freereg r1

						//overrides.c, line 60
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 503
						// matchobj comparing flags 2 with 608
						// matchobj comparing flags 2 with 608
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x503
	ldt
						// (save temp)store type 3
	st	r2
						//save_temp done

						//overrides.c, line 61
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 2
						// matchobj comparing flags 161 with 608
						// deref
						// const to r0
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 608
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2
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
	.section	.text.47
	.global	_configstring_next
_configstring_next:
	stdec	r6
						// allocreg r2

						//overrides.c, line 102
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 101
						// const
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done

						//overrides.c, line 103
						// (test)
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l280,0
						//static deref
						//sizemod based on type 0xa
	ldt

						//overrides.c, line 103
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l284
		add	r7
						// allocreg r1

						//overrides.c, line 104
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 2

			// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 104
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l280,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type a
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1

						//overrides.c, line 104
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 2
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
l284: # 

						//overrides.c, line 105
						// (test)
						// (obj to tmp) flags 42 type 101
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//overrides.c, line 105
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l286
		add	r7

						//overrides.c, line 106
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l280,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type a
	st	r0
						//save_temp done
l286: # 
						// allocreg r1

						//overrides.c, line 107
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 101
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r0
						//save_temp done
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.48
	.global	_configstring_begin
_configstring_begin:
	stdec	r6

						//overrides.c, line 112
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l280,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_configstring
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)store type a
	st	r0
						//save_temp done
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
	.section	.text.49
	.global	_clearram
_clearram:
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
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	-48
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-44
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//overrides.c, line 148
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//overrides.c, line 149
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	85
						// (save temp)store type 3
	st	r3
						//save_temp done

						//overrides.c, line 150
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 503
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	ldidx	r6
						// (save temp)store type 3
	st	r3
						//save_temp done

						//overrides.c, line 151
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
						// (save temp)store type 3
	st	r4
						//save_temp done

						//overrides.c, line 153
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//overrides.c, line 154
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	83
						// (save temp)store type 3
	st	r3
						//save_temp done

						//overrides.c, line 155
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)store type 3
	st	r3
						//save_temp done

						//overrides.c, line 156
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r4
						//save_temp done

						//overrides.c, line 158
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r4
						//save_temp done

						//overrides.c, line 159
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	84
						// (save temp)store type 3
	st	r3
						//save_temp done

						//overrides.c, line 160
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 161
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sgn
	cmp	r2

						//overrides.c, line 161
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l296
		add	r7
l295: # 

						//overrides.c, line 161
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	0
						// (save temp)store type 3
	st	r3
						//save_temp done

						//overrides.c, line 161
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r1
						// (save result) // isreg

						//overrides.c, line 161
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	sgn
	cmp	r1

						//overrides.c, line 161
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l295
		add	r7
l296: # 

						//overrides.c, line 162
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	4
						// (save temp)store type 3
	st	r4
						//save_temp done

						//overrides.c, line 164
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//overrides.c, line 165
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	83
						// (save temp)store type 3
	st	r3
						//save_temp done

						//overrides.c, line 166
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r3
						//save_temp done

						//overrides.c, line 167
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4
						// (save temp)store type 3
	st	r4
						//save_temp done
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
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.4a
	.global	_setromtype
_setromtype:
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
						// allocreg r2
						// allocreg r1

						//overrides.c, line 173
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 64
						// extern
	.liabs	_romtype
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 173
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	sgn
	cmp	r1
						// freereg r1

						//overrides.c, line 173
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l305
		add	r7

						//overrides.c, line 173
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6
						// allocreg r1

						//overrides.c, line 173
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 173
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//overrides.c, line 173
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 173
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l305
		add	r7
						// allocreg r1

						//overrides.c, line 176
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_file, 8
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	10
	shr	r2
						// (save result) // isreg
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	192
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l304
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	64
	sub	r2
						// (save result) // isreg
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l305
		add	r7

						//overrides.c, line 178
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_romtype
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

						//overrides.c, line 180
						//pcreltotemp
	.lipcrel	l305
	add	r7
l304: # 

						//overrides.c, line 183
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_romtype
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
l305: # 
						// freereg r1
						// freereg r2
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
	.section	.text.4b
	.global	_handlemouse
_handlemouse:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r3
						// allocreg r1

						//overrides.c, line 213
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r2 - only match against tmp
	//mt
				// flags 42
	and	r2

						//overrides.c, line 213
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l315
		add	r7

						//overrides.c, line 214
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l311,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l315: # 
						// allocreg r1

						//overrides.c, line 216
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l308,0
						//static deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 216
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 216
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 216
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l339
		add	r7
						// allocreg r1

						//overrides.c, line 218
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	20
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 218
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 218
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l308,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 220
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l311,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//overrides.c, line 220
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l319
		add	r7
						// allocreg r1

						//overrides.c, line 222
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_mousebuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 222
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_read
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 222
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r0
						// freereg r1

						//overrides.c, line 222
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l341
		add	r7
l340: # 
						// allocreg r1

						//overrides.c, line 222
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_mousebuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 222
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_read
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 222
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r0
						// freereg r1

						//overrides.c, line 222
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l340
		add	r7
l341: # 
						// allocreg r1

						//overrides.c, line 224
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l311,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 224
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l311,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1

						//overrides.c, line 224
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_initmouse
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//overrides.c, line 224
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 6a type 101
						// matchobj comparing flags 106 with 130
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l312,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//overrides.c, line 225
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l313,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//overrides.c, line 228
						//pcreltotemp
	.lipcrel	l339
	add	r7
l319: # 
						// allocreg r1

						//overrides.c, line 229
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l313,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//overrides.c, line 229
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l325
		add	r7
						// freereg r1
						// allocreg r1

						//overrides.c, line 231
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_mousebuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 231
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_read
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 232
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r0
						// freereg r1

						//overrides.c, line 232
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l327
		add	r7
						// allocreg r1

						//overrides.c, line 235
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l313,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
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
 						// static
	.liabs	l313,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 237
						//pcreltotemp
	.lipcrel	l330
	add	r7
						// freereg r1
l327: # 
						// allocreg r1

						//overrides.c, line 237
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l309,0
						//static deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 237
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 237
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 237
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l330
		add	r7
						// allocreg r1

						//overrides.c, line 240
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_mousebuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 240
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_init
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 241
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l311,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
l330: # 
						// allocreg r1

						//overrides.c, line 244
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l312,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//overrides.c, line 244
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l339
		add	r7

						//overrides.c, line 244
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l313,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//overrides.c, line 244
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l339
		add	r7
						// freereg r1
						// allocreg r1

						//overrides.c, line 246
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l311,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 246
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l311,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1

						//overrides.c, line 246
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_initmouse
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//overrides.c, line 246
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 130
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//overrides.c, line 247
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 106
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	128
	and	r1
						// (save result) // isreg
						// freereg r1

						//overrides.c, line 247
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l335
		add	r7
						// allocreg r1

						//overrides.c, line 249
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	127
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l313,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 253
						//pcreltotemp
	.lipcrel	l339
	add	r7
l335: # 

						//overrides.c, line 254
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l312,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r3

						//overrides.c, line 259
						//pcreltotemp
	.lipcrel	l339
	add	r7
l325: # 

						//overrides.c, line 259
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l312,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//overrides.c, line 259
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l339
		add	r7
						// freereg r1
						// allocreg r1

						//overrides.c, line 261
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l311,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 261
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l311,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1

						//overrides.c, line 261
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_initmouse
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//overrides.c, line 261
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
	mr	r1
						//save_temp done

						//overrides.c, line 261
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1
						// allocreg r1

						//overrides.c, line 261
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_mousebuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 261
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//overrides.c, line 262
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l312,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
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
 						// static
	.liabs	l312,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 263
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l313,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//overrides.c, line 264
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	3500
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 264
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 264
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l309,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
l339: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.data.4c
	.align	4
l308:
	.int	0
	.section	.data.4d
	.align	4
l311:
	.int	0
	.section	.data.4e
	.align	4
l312:
	.int	0
	.section	.data.4f
	.align	4
l313:
	.int	0
	.section	.bss.50
	.align	4
	.lcomm	l309,4
	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.51
	.global	_toggle
_toggle:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//overrides.c, line 365
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 365
						//call
						//pcreltotemp
	.lipcrel	_cycle
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 366
						// (test)
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_menu_longpress
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//overrides.c, line 366
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l345
		add	r7

						//overrides.c, line 367
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	3
	stdec	r6
						// allocreg r1

						//overrides.c, line 367
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16384
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 367
						//call
						//pcreltotemp
	.lipcrel	_clearram
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l345: # 
						// allocreg r1

						//overrides.c, line 368
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 368
						//call
						//pcreltotemp
	.lipcrel	_cycle
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r3
	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.52
	.global	_toggle_wp
_toggle_wp:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3

						//overrides.c, line 382
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//overrides.c, line 384
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	500
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 384
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 384
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r3
						// allocreg r1

						//overrides.c, line 385
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 66
						// reg r3 - only match against tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 385
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 385
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 385
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l355
		add	r7
l354: # 
						// allocreg r1

						//overrides.c, line 385
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 385
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 385
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 385
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l354
		add	r7
l355: # 
						// allocreg r1
						// freereg r1
						// freereg r3
	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.53
	.global	_loadconfig
_loadconfig:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-8
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
						// allocreg r1

						//overrides.c, line 393
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//overrides.c, line 395
						//call
						//pcreltotemp
	.lipcrel	_CurrentDirectory
	add	r7
						// Flow control - popping 0 + 0 bytes

						//overrides.c, line 395
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//overrides.c, line 396
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r3 - only match against tmp
	mt	r3
				// flags 42
	and	r3

						//overrides.c, line 396
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l356
		add	r7
						// freereg r1

						//overrides.c, line 399
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_romtype
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//overrides.c, line 401
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6
						// allocreg r1

						//overrides.c, line 401
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 1
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 401
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//overrides.c, line 401
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 401
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l369
		add	r7

						//overrides.c, line 405
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_statusword
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
	.liconst	1
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 406
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//overrides.c, line 407
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//overrides.c, line 407
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 407
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//overrides.c, line 409
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sector_buffer, 12
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r6
						//save_temp done

						//overrides.c, line 410
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_sector_buffer, 16
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//overrides.c, line 414
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_sector_buffer
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 414
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	1
	cmp	r1
						// freereg r1

						//overrides.c, line 414
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l369
		add	r7
						// allocreg r1

						//overrides.c, line 417
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_sector_buffer, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	1
	or	r1
						// (save result) // isreg

						//overrides.c, line 418
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	-3073
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//overrides.c, line 419
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 2 type 101
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 1
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_scandouble, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//overrides.c, line 421
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_sector_buffer, 8
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 421
						//call
						//pcreltotemp
	.lipcrel	_ValidateDirectory
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 421
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 421
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l365
		add	r7

						//overrides.c, line 423
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//overrides.c, line 423
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 423
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r1

						//overrides.c, line 424
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_sector_buffer, 8
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 424
						//call
						//pcreltotemp
	.lipcrel	_ChangeDirectoryByCluster
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r1

						//overrides.c, line 425
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//overrides.c, line 425
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 20)
	.liabs	_sector_buffer, 20
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 425
						//call
						//pcreltotemp
	.lipcrel	_loadimage
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1

						//overrides.c, line 425
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5
l365: # 
						// allocreg r1

						//overrides.c, line 433
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 433
						//call
						//pcreltotemp
	.lipcrel	_ChangeDirectoryByCluster
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//overrides.c, line 434
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6
						// allocreg r1

						//overrides.c, line 434
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 434
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//overrides.c, line 436
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 436
						//call
						//pcreltotemp
	.lipcrel	_ValidateDirectory
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 436
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 436
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l367
		add	r7

						//overrides.c, line 438
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//overrides.c, line 438
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 438
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r1

						//overrides.c, line 439
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_sector_buffer, 12
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 439
						//call
						//pcreltotemp
	.lipcrel	_ChangeDirectoryByCluster
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r1

						//overrides.c, line 440
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	50
	stdec	r6
						// allocreg r1

						//overrides.c, line 440
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 32)
	.liabs	_sector_buffer, 32
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 440
						//call
						//pcreltotemp
	.lipcrel	_loadimage
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1
l367: # 
						// allocreg r1

						//overrides.c, line 449
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 449
						//call
						//pcreltotemp
	.lipcrel	_ChangeDirectoryByCluster
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//overrides.c, line 450
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6
						// allocreg r1

						//overrides.c, line 450
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 450
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//overrides.c, line 452
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x103
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 452
						//call
						//pcreltotemp
	.lipcrel	_ValidateDirectory
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 452
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 452
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l369
		add	r7

						//overrides.c, line 454
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//overrides.c, line 454
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 454
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r1

						//overrides.c, line 455
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_sector_buffer, 16
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 455
						//call
						//pcreltotemp
	.lipcrel	_ChangeDirectoryByCluster
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r1

						//overrides.c, line 456
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	51
	stdec	r6
						// allocreg r1

						//overrides.c, line 456
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 44)
	.liabs	_sector_buffer, 44
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 456
						//call
						//pcreltotemp
	.lipcrel	_loadimage
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1
l369: # 

						//overrides.c, line 473
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
	stdec	r6
						// allocreg r1

						//overrides.c, line 473
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16384
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 473
						//call
						//pcreltotemp
	.lipcrel	_clearram
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//overrides.c, line 474
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	3
	stdec	r6
						// allocreg r1

						//overrides.c, line 474
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16384
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 474
						//call
						//pcreltotemp
	.lipcrel	_clearram
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1

						//overrides.c, line 475
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_statusword
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
	.liconst	-2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 476
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//overrides.c, line 477
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_scandouble
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 477
						//call
						//pcreltotemp
	.lipcrel	_SetScandouble
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l356: # 
						// allocreg r1

						//overrides.c, line 478
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
	mr	r0
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
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
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.54
	.global	_saveconfig
_saveconfig:
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

						//overrides.c, line 484
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	10
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 484
						//call
						//pcreltotemp
	.lipcrel	_putchar
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//overrides.c, line 485
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6
						// allocreg r1

						//overrides.c, line 485
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 485
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//overrides.c, line 485
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 485
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l375
		add	r7

						//overrides.c, line 487
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_configfile_data
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//overrides.c, line 488
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_scandouble
						//extern deref
						//sizemod based on type 0x3
	ldt
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//overrides.c, line 489
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						//extern: comparing 4 with 2
						//Fuzzy match found, offset: 2 (varadr: 1)
	.liconst	2
	add	r0

						// required value found in r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//overrides.c, line 491
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						//extern: comparing 31 with 4
						//Fuzzy match found, offset: 27 (varadr: 1)
	.liconst	27
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//overrides.c, line 492
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 43 with 32
						//Fuzzy match found, offset: 11 (varadr: 1)
	.liconst	11
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//overrides.c, line 493
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 55 with 44
						//Fuzzy match found, offset: 11 (varadr: 1)
	.liconst	11
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//overrides.c, line 494
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 56
						//Fuzzy match found, offset: -56 (varadr: 0)
	.liconst	-56
	addt	r0

			// required value found in tmp
	stdec	r6
						// allocreg r1

						//overrides.c, line 494
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 56
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 56
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 494
						//call
						//pcreltotemp
	.lipcrel	_FileWriteSector
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	4
	add	r6
						// freereg r1

						//overrides.c, line 495
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0

						//overrides.c, line 496
						//pcreltotemp
	.lipcrel	l372
	add	r7
l375: # 
						// allocreg r1

						//overrides.c, line 497
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0
l372: # 
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
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.55
	.global	_loadimage
_loadimage:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-12
	add	r6
						// allocreg r5
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 40 type a
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
						// allocreg r4
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//overrides.c, line 503
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done

						//overrides.c, line 504
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	28
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	48
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
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	28
	ldidx	r6
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l379
		add	r7
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
				// flags 2
	//mr
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l383
		add	r7
						// (bitwise/arithmetic) 	//ops: 0, 0, 5
						// (obj to r4) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r4
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l383
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l385
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l385
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	16
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l393
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l394
		add	r7
						//pcreltotemp
	.lipcrel	l378
	add	r7
l379: # 

						//overrides.c, line 510
						// (test)
						// (obj to tmp) flags 42 type a
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//overrides.c, line 510
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l378
		add	r7

						//overrides.c, line 510
						// (test)
						// (obj to tmp) flags 62 type 301
						// matchobj comparing flags 98 with 66
						// deref 
	byt
	ld	r5

						//overrides.c, line 510
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l378
		add	r7
						// freereg r1
						// freereg r2
						// freereg r3

						//overrides.c, line 512
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	2
	stdec	r6
						// allocreg r1

						//overrides.c, line 512
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16384
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 512
						//call
						//pcreltotemp
	.lipcrel	_clearram
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r3

						//overrides.c, line 513
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 20)
	.liabs	_configfile_data, 20
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//overrides.c, line 513
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//overrides.c, line 513
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	11
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 513
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//overrides.c, line 514
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 31)
	.liabs	_configfile_data, 31
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

						//overrides.c, line 515
						//call
						//pcreltotemp
	.lipcrel	_CurrentDirectory
	add	r7
						// Flow control - popping 0 + 0 bytes

						//overrides.c, line 515
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 8)
	.liabs	_configfile_data, 12
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 516
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_statusword
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
	.liconst	1
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 517
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//overrides.c, line 518
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 20)
	.liabs	_configfile_data, 20
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 518
						//call
						//pcreltotemp
	.lipcrel	_setromtype
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 519
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 20)
	.liabs	_configfile_data, 20
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 519
						//call
						//pcreltotemp
	.lipcrel	_LoadROM
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 520
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)store type 3
	st	r6
						//save_temp done

						//overrides.c, line 522
						//pcreltotemp
	.lipcrel	l378
	add	r7
l383: # 
						// allocreg r3
						// allocreg r2

						//overrides.c, line 526
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6
						// allocreg r1

						//overrides.c, line 526
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 526
						//call
						//pcreltotemp
	.lipcrel	_diskimg_mount
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r1

						//overrides.c, line 527
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 527
						//call
						//pcreltotemp
	.lipcrel	_toggle_wp
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r1

						//overrides.c, line 528
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6
						// allocreg r1

						//overrides.c, line 528
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 528
						//call
						//pcreltotemp
	.lipcrel	_diskimg_mount
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//overrides.c, line 529
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	72
	mul	r1
						// (save result) // isreg

						//overrides.c, line 529
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_diskimg
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//overrides.c, line 529
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	8
	add	r1
						// (save result) // isreg

						//overrides.c, line 529
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 6a type 3
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r1
						// (save temp)store type 3
	st	r6
						//save_temp done
						// freereg r1

						//overrides.c, line 530
						//pcreltotemp
	.lipcrel	l378
	add	r7
l385: # 
						// allocreg r1

						//overrides.c, line 534
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	72
	mul	r1
						// (save result) // isreg

						//overrides.c, line 534
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 82 type a
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_diskimg
						// extern pe is varadr
	mr	r0
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching
						// freereg r1

						//overrides.c, line 534
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 62 type a
						// matchobj comparing flags 98 with 98

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	8
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching

						//overrides.c, line 534
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 162 with 130
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 130
	.liconst	4
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//overrides.c, line 535
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//overrides.c, line 535
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l388
		add	r7
						// freereg r2
						// freereg r3
						// freereg r4
						// allocreg r4

						//overrides.c, line 537
						// (bitwise/arithmetic) 	//ops: 0, 0, 5
						// (obj to r4) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	12
	mul	r4
						// (save result) // isreg

						//overrides.c, line 537
						// (bitwise/arithmetic) 	//ops: 0, 5, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 8)
	.liabs	_configfile_data, 8
						// extern pe is varadr
	add	r4
						// (save result) // isreg
						// allocreg r3

						//overrides.c, line 537
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//overrides.c, line 537
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 74
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//overrides.c, line 537
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	11
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 537
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r3
						// freereg r2
						// freereg r1
						// allocreg r1

						//overrides.c, line 538
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	11
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 538
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//overrides.c, line 539
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 1
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6
						// freereg r4
						// allocreg r1

						//overrides.c, line 539
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	4
						//sizemod based on type 0xa
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 539
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//overrides.c, line 542
						//pcreltotemp
	.lipcrel	l389
	add	r7
l388: # 
						// allocreg r4
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//overrides.c, line 542
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	12
	mul	r1
						// (save result) // isreg

						//overrides.c, line 542
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 8)
	.liabs	_configfile_data, 8
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//overrides.c, line 542
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// freereg r2
l389: # 

						//overrides.c, line 543
						//call
						//pcreltotemp
	.lipcrel	_CurrentDirectory
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r2

						//overrides.c, line 543
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r2
						// allocreg r1

						//overrides.c, line 543
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	mul	r1
						// (save result) // isreg

						//overrides.c, line 543
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 4)
	.liabs	_configfile_data, 4
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//overrides.c, line 543
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r2
						// freereg r1

						//overrides.c, line 545
						// (test)
						// (obj to tmp) flags 22 type 103
						// matchobj comparing flags 34 with 74
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 74
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 74
	.liconst	4
	ldidx	r6
						//sizemod based on type 0x103
	ldt

						//overrides.c, line 545
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l391
		add	r7
						// allocreg r2
						// allocreg r1

						//overrides.c, line 546
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 34
						// var, auto|reg
						// matchobj comparing flags 1 with 34
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	sub	r1
						// (save result) // isreg

						//overrides.c, line 546
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1024
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r1

						//overrides.c, line 546
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//overrides.c, line 548
						//pcreltotemp
	.lipcrel	l392
	add	r7
l391: # 
						// allocreg r1

						//overrides.c, line 548
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	sub	r1
						// (save result) // isreg

						//overrides.c, line 548
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1024
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r1

						//overrides.c, line 548
						//comp
						// (obj to r1) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
						// matchobj comparing flags 1 with 74
	.liconst	-1
	xor	r1
						// (save result) // isreg

						//overrides.c, line 548
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
l392: # 
						// allocreg r1

						//overrides.c, line 549
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 22 type 3
						// deref 
						// (prepobj tmp)
 						// deref
						// var FIXME - deref?
						// reg - auto
	.liconst	4
	ldidx	r6
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r6
						//save_temp done

						//overrides.c, line 550
						//pcreltotemp
	.lipcrel	l378
	add	r7
						// freereg r1
l393: # 
						// allocreg r1

						//overrides.c, line 553
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 553
						//call
						//pcreltotemp
	.lipcrel	_loadconfig
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 553
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x62
	mt	r0
	st	r6

						//overrides.c, line 554
						//pcreltotemp
	.lipcrel	l378
	add	r7
l394: # 
						// allocreg r1

						//overrides.c, line 556
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 556
						//call
						//pcreltotemp
	.lipcrel	_saveconfig
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 556
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x62
	mt	r0
	st	r6
l378: # 
						// allocreg r1

						//overrides.c, line 559
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// extern
	.liabs	_statusword
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
	.liconst	-2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 560
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//overrides.c, line 561
						//setreturn
						// (obj to r0) flags 62 type 3
						// deref 
	ld	r6
	mr	r0
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
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

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.56
	.global	_autoboot
_autoboot:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3

						//overrides.c, line 580
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_statusword
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

						//overrides.c, line 582
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_romtype
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//overrides.c, line 583
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 1
						// extern (offset 0)
	.liabs	_configstring_index
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

						//overrides.c, line 585
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//overrides.c, line 586
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	3
	stdec	r6
						// allocreg r1

						//overrides.c, line 586
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16384
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 586
						//call
						//pcreltotemp
	.lipcrel	_clearram
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//overrides.c, line 587
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
	stdec	r6
						// allocreg r1

						//overrides.c, line 587
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16384
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 587
						//call
						//pcreltotemp
	.lipcrel	_clearram
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//overrides.c, line 589
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_bootcfg_name
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 589
						//call
						//pcreltotemp
	.lipcrel	_loadconfig
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 589
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 589
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l410
		add	r7

						//overrides.c, line 591
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//overrides.c, line 592
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// extern
	.liabs	_bootrom_name
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 592
						//call
						//pcreltotemp
	.lipcrel	_setromtype
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 593
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// extern
	.liabs	_bootrom_name
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 593
						//call
						//pcreltotemp
	.lipcrel	_LoadROM
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 594
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// extern
	.liabs	_statusword
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
	.liconst	-2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 595
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//overrides.c, line 596
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	400
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 596
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 596
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r3
						// allocreg r1

						//overrides.c, line 597
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 66
						// reg r3 - only match against tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 597
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 597
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 597
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l409
		add	r7
l407: # 
						// allocreg r1

						//overrides.c, line 597
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 597
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 597
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 597
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l407
		add	r7
l409: # 

						//overrides.c, line 599
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// extern
	.liabs	_statusword
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
	.liconst	1
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 600
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//overrides.c, line 601
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	100
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 601
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 601
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r3
						// allocreg r1

						//overrides.c, line 602
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 66
						// reg r3 - only match against tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 602
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 602
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 602
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l410
		add	r7
l408: # 
						// allocreg r1

						//overrides.c, line 602
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 602
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 602
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 602
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l408
		add	r7
l410: # 

						//overrides.c, line 605
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// extern
	.liabs	_statusword
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
	.liconst	-2
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//overrides.c, line 606
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//overrides.c, line 608
						//call
						//pcreltotemp
	.lipcrel	_initc64keys
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//overrides.c, line 613
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// allocreg r1

						//overrides.c, line 614
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 614
						//call
						//pcreltotemp
	.lipcrel	_handlemouse
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//overrides.c, line 616
						//setreturn
						// (obj to r0) flags 1 type a
						// const
	.liconst	0
	mr	r0
						// freereg r3
	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.57
	.global	_UpdateKeys
_UpdateKeys:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1

						//overrides.c, line 624
						//call
						//pcreltotemp
	.lipcrel	_handlec64keys
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// allocreg r1

						//overrides.c, line 625
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 625
						//call
						//pcreltotemp
	.lipcrel	_HandlePS2RawCodes
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//overrides.c, line 625
						//setreturn
						// (obj to r0) flags 4a type 3
						// reg r0 - only match against tmp
						// freereg r1
						// freereg r3
	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.58
	.weak	_mainloop
_mainloop:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
	.liconst	-4
	add	r6
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8191
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 162 type 3
						// matchobj comparing flags 354 with 1
						// deref 
	ld	r6
						// (save temp)isreg
	mr	r3
						//save_temp done
l415: # 
						// allocreg r1

						//overrides.c, line 633
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 633
						//call
						//pcreltotemp
	.lipcrel	_handlemouse
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 634
						//call
						//pcreltotemp
	.lipcrel	_Menu_Run
	add	r7
						// Flow control - popping 0 + 0 bytes

						//overrides.c, line 635
						//call
						//pcreltotemp
	.lipcrel	_diskimg_poll
	add	r7
						// Flow control - popping 0 + 0 bytes

						//overrides.c, line 636
						//call
						//pcreltotemp
	.lipcrel	_mist_get_dmastate
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//overrides.c, line 637
						// (bitwise/arithmetic) 	//ops: 4, 5, 2
						// (obj to r1) flags 4a type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 240 type 3
						// matchobj comparing flags 576 with 74
						// reg r4 - only match against tmp
	mt	r4
	and	r1
						// (save result) // isreg

						//overrides.c, line 637
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 576
						// const
						// matchobj comparing flags 1 with 576
	.liconst	1
	add	r3
						// (save result) // isreg

						//overrides.c, line 637
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
				// flags 4a
	and	r1
						// freereg r1

						//overrides.c, line 637
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l415
		add	r7

						//overrides.c, line 638
						//call
						//pcreltotemp
	.lipcrel	_get_rtc
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//overrides.c, line 638
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//overrides.c, line 638
						//call
						//pcreltotemp
	.lipcrel	_user_io_send_rtc
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 631
						//pcreltotemp
	.lipcrel	l415
	add	r7
						// freereg r3
						// freereg r4
	.liconst	-4
	sub	r6
	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.data.59
	.align	4
	.global	_specialtable
_specialtable:
	.byte	244
	.byte	235
	.byte	242
	.byte	245
	.byte	5
	.byte	6
	.byte	4
	.byte	12
	.byte	3
	.byte	11
	.byte	131
	.byte	10
	.section	.data.5a
	.align	4
	.global	_c64keytable
_c64keytable:
	.int	102
	.int	14286938
	.int	143949824
	.int	7897093
	.int	98306
	.int	622595
	.int	32772
	.int	143753217
	.int	38
	.int	29
	.int	28
	.int	37
	.int	26
	.int	27
	.int	36
	.int	274
	.int	46
	.int	45
	.int	35
	.int	54
	.int	33
	.int	43
	.int	44
	.int	34
	.int	7077949
	.int	53
	.int	52
	.int	7667774
	.int	50
	.int	51
	.int	7012412
	.int	42
	.int	8192070
	.int	7536707
	.int	6881339
	.int	13238341
	.int	7340090
	.int	7471170
	.int	7602244
	.int	49
	.int	85
	.int	8126541
	.int	7995467
	.int	123
	.int	7405641
	.int	8650828
	.int	7798868
	.int	65
	.int	97
	.int	8126555
	.int	82
	.int	241
	.int	601
	.int	6094862
	.int	93
	.int	7929930
	.int	22
	.int	458870
	.int	853012
	.int	30
	.int	41
	.int	17
	.int	21
	.int	16384
	.section	.data.5b
	.align	4
	.global	_configstring
_configstring:
						// Declaring from tree
						// static
	.ref	l279
	.section	.data.5c
	.align	4
	.global	_joy_keymap
_joy_keymap:
	.byte	88
	.byte	18
	.byte	20
	.byte	17
	.byte	29
	.byte	27
	.byte	28
	.byte	35
	.byte	90
	.byte	89
	.byte	148
	.byte	145
	.byte	245
	.byte	242
	.byte	235
	.byte	244
	.section	.data.5d
	.align	4
	.global	_initmouse
_initmouse:
	.byte	1
	.byte	255
	.byte	130
	.byte	8
	.byte	243
	.byte	200
	.byte	243
	.byte	100
	.byte	243
	.byte	80
	.byte	242
	.byte	1
	.byte	129
	.byte	1
	.byte	244
	.byte	0
	.section	.data.5e
	.align	4
	.global	_bootrom_name
_bootrom_name:
						// Declaring from tree
						// static
	.ref	l395
	.section	.data.5f
	.align	4
	.global	_bootcfg_name
_bootcfg_name:
						// Declaring from tree
						// static
	.ref	l396
	.section	.bss.60
	.align	4
	.global	_c64keys
	.comm	_c64keys,64
	.section	.bss.61
	.align	4
	.global	_configfile_data
	.comm	_configfile_data,56
	.section	.rodata.62
	.align	4
l279:
	.byte	65
	.byte	116
	.byte	97
	.byte	114
	.byte	105
	.byte	32
	.byte	83
	.byte	84
	.byte	59
	.byte	59
	.byte	80
	.byte	49
	.byte	44
	.byte	83
	.byte	116
	.byte	111
	.byte	114
	.byte	97
	.byte	103
	.byte	101
	.byte	59
	.byte	80
	.byte	49
	.byte	83
	.byte	48
	.byte	85
	.byte	44
	.byte	83
	.byte	84
	.byte	32
	.byte	44
	.byte	70
	.byte	108
	.byte	111
	.byte	112
	.byte	112
	.byte	121
	.byte	32
	.byte	65
	.byte	58
	.byte	59
	.byte	80
	.byte	49
	.byte	83
	.byte	49
	.byte	85
	.byte	44
	.byte	83
	.byte	84
	.byte	32
	.byte	44
	.byte	70
	.byte	108
	.byte	111
	.byte	112
	.byte	112
	.byte	121
	.byte	32
	.byte	66
	.byte	58
	.byte	59
	.byte	80
	.byte	49
	.byte	79
	.byte	54
	.byte	55
	.byte	44
	.byte	87
	.byte	114
	.byte	105
	.byte	116
	.byte	101
	.byte	32
	.byte	112
	.byte	114
	.byte	111
	.byte	116
	.byte	101
	.byte	99
	.byte	116
	.byte	44
	.byte	79
	.byte	102
	.byte	102
	.byte	44
	.byte	65
	.byte	58
	.byte	44
	.byte	66
	.byte	58
	.byte	44
	.byte	66
	.byte	111
	.byte	116
	.byte	104
	.byte	59
	.byte	80
	.byte	49
	.byte	79
	.byte	65
	.byte	66
	.byte	44
	.byte	72
	.byte	97
	.byte	114
	.byte	100
	.byte	32
	.byte	100
	.byte	105
	.byte	115
	.byte	107
	.byte	115
	.byte	44
	.byte	78
	.byte	111
	.byte	110
	.byte	101
	.byte	44
	.byte	85
	.byte	110
	.byte	105
	.byte	116
	.byte	32
	.byte	48
	.byte	44
	.byte	85
	.byte	110
	.byte	105
	.byte	116
	.byte	32
	.byte	49
	.byte	44
	.byte	66
	.byte	111
	.byte	116
	.byte	104
	.byte	59
	.byte	80
	.byte	49
	.byte	83
	.byte	50
	.byte	85
	.byte	44
	.byte	72
	.byte	68
	.byte	70
	.byte	86
	.byte	72
	.byte	68
	.byte	44
	.byte	72
	.byte	97
	.byte	114
	.byte	100
	.byte	102
	.byte	105
	.byte	108
	.byte	101
	.byte	32
	.byte	48
	.byte	59
	.byte	80
	.byte	49
	.byte	83
	.byte	51
	.byte	85
	.byte	44
	.byte	72
	.byte	68
	.byte	70
	.byte	86
	.byte	72
	.byte	68
	.byte	44
	.byte	72
	.byte	97
	.byte	114
	.byte	100
	.byte	102
	.byte	105
	.byte	108
	.byte	101
	.byte	32
	.byte	49
	.byte	59
	.byte	80
	.byte	50
	.byte	44
	.byte	83
	.byte	121
	.byte	115
	.byte	116
	.byte	101
	.byte	109
	.byte	59
	.byte	80
	.byte	50
	.byte	79
	.byte	78
	.byte	79
	.byte	44
	.byte	67
	.byte	104
	.byte	105
	.byte	112
	.byte	115
	.byte	101
	.byte	116
	.byte	44
	.byte	83
	.byte	84
	.byte	44
	.byte	83
	.byte	84
	.byte	69
	.byte	44
	.byte	77
	.byte	101
	.byte	103
	.byte	97
	.byte	83
	.byte	84
	.byte	69
	.byte	44
	.byte	83
	.byte	84
	.byte	69
	.byte	114
	.byte	111
	.byte	105
	.byte	100
	.byte	115
	.byte	59
	.byte	80
	.byte	50
	.byte	79
	.byte	74
	.byte	44
	.byte	83
	.byte	84
	.byte	32
	.byte	66
	.byte	108
	.byte	105
	.byte	116
	.byte	116
	.byte	101
	.byte	114
	.byte	44
	.byte	79
	.byte	102
	.byte	102
	.byte	44
	.byte	79
	.byte	110
	.byte	59
	.byte	80
	.byte	50
	.byte	79
	.byte	49
	.byte	51
	.byte	44
	.byte	82
	.byte	65
	.byte	77
	.byte	32
	.byte	40
	.byte	110
	.byte	101
	.byte	101
	.byte	100
	.byte	32
	.byte	72
	.byte	97
	.byte	114
	.byte	100
	.byte	32
	.byte	82
	.byte	101
	.byte	115
	.byte	101
	.byte	116
	.byte	41
	.byte	44
	.byte	53
	.byte	49
	.byte	50
	.byte	75
	.byte	44
	.byte	49
	.byte	77
	.byte	66
	.byte	44
	.byte	50
	.byte	77
	.byte	66
	.byte	44
	.byte	52
	.byte	77
	.byte	66
	.byte	44
	.byte	56
	.byte	77
	.byte	66
	.byte	44
	.byte	49
	.byte	52
	.byte	77
	.byte	66
	.byte	59
	.byte	80
	.byte	50
	.byte	70
	.byte	44
	.byte	73
	.byte	77
	.byte	71
	.byte	82
	.byte	79
	.byte	77
	.byte	44
	.byte	76
	.byte	111
	.byte	97
	.byte	100
	.byte	32
	.byte	82
	.byte	79
	.byte	77
	.byte	59
	.byte	80
	.byte	50
	.byte	70
	.byte	44
	.byte	66
	.byte	73
	.byte	78
	.byte	83
	.byte	84
	.byte	67
	.byte	44
	.byte	76
	.byte	111
	.byte	97
	.byte	100
	.byte	32
	.byte	67
	.byte	97
	.byte	114
	.byte	116
	.byte	114
	.byte	105
	.byte	100
	.byte	103
	.byte	101
	.byte	59
	.byte	80
	.byte	51
	.byte	44
	.byte	83
	.byte	111
	.byte	117
	.byte	110
	.byte	100
	.byte	32
	.byte	38
	.byte	32
	.byte	86
	.byte	105
	.byte	100
	.byte	101
	.byte	111
	.byte	59
	.byte	80
	.byte	51
	.byte	79
	.byte	56
	.byte	44
	.byte	86
	.byte	105
	.byte	100
	.byte	101
	.byte	111
	.byte	32
	.byte	109
	.byte	111
	.byte	100
	.byte	101
	.byte	44
	.byte	77
	.byte	111
	.byte	110
	.byte	111
	.byte	44
	.byte	67
	.byte	111
	.byte	108
	.byte	111
	.byte	117
	.byte	114
	.byte	59
	.byte	80
	.byte	51
	.byte	79
	.byte	83
	.byte	44
	.byte	86
	.byte	105
	.byte	107
	.byte	105
	.byte	110
	.byte	103
	.byte	47
	.byte	83
	.byte	77
	.byte	49
	.byte	57
	.byte	52
	.byte	44
	.byte	79
	.byte	102
	.byte	102
	.byte	44
	.byte	79
	.byte	110
	.byte	59
	.byte	80
	.byte	51
	.byte	79
	.byte	75
	.byte	76
	.byte	44
	.byte	83
	.byte	99
	.byte	97
	.byte	110
	.byte	108
	.byte	105
	.byte	110
	.byte	101
	.byte	115
	.byte	44
	.byte	79
	.byte	102
	.byte	102
	.byte	44
	.byte	50
	.byte	53
	.byte	37
	.byte	44
	.byte	53
	.byte	48
	.byte	37
	.byte	44
	.byte	55
	.byte	53
	.byte	37
	.byte	59
	.byte	80
	.byte	51
	.byte	79
	.byte	84
	.byte	44
	.byte	67
	.byte	111
	.byte	109
	.byte	112
	.byte	111
	.byte	115
	.byte	105
	.byte	116
	.byte	101
	.byte	32
	.byte	98
	.byte	108
	.byte	101
	.byte	110
	.byte	100
	.byte	44
	.byte	79
	.byte	102
	.byte	102
	.byte	44
	.byte	79
	.byte	110
	.byte	59
	.byte	80
	.byte	51
	.byte	79
	.byte	77
	.byte	44
	.byte	83
	.byte	116
	.byte	101
	.byte	114
	.byte	101
	.byte	111
	.byte	32
	.byte	115
	.byte	111
	.byte	117
	.byte	110
	.byte	100
	.byte	44
	.byte	79
	.byte	102
	.byte	102
	.byte	44
	.byte	79
	.byte	110
	.byte	59
	.byte	80
	.byte	51
	.byte	79
	.byte	85
	.byte	44
	.byte	83
	.byte	116
	.byte	101
	.byte	105
	.byte	110
	.byte	98
	.byte	101
	.byte	114
	.byte	103
	.byte	32
	.byte	100
	.byte	111
	.byte	110
	.byte	103
	.byte	108
	.byte	101
	.byte	44
	.byte	79
	.byte	102
	.byte	102
	.byte	44
	.byte	79
	.byte	110
	.byte	59
	.byte	83
	.byte	67
	.byte	44
	.byte	67
	.byte	70
	.byte	71
	.byte	44
	.byte	76
	.byte	111
	.byte	97
	.byte	100
	.byte	32
	.byte	99
	.byte	111
	.byte	110
	.byte	102
	.byte	105
	.byte	103
	.byte	59
	.byte	83
	.byte	68
	.byte	44
	.byte	67
	.byte	70
	.byte	71
	.byte	44
	.byte	83
	.byte	97
	.byte	118
	.byte	101
	.byte	32
	.byte	99
	.byte	111
	.byte	110
	.byte	102
	.byte	105
	.byte	103
	.byte	59
	.byte	84
	.byte	48
	.byte	44
	.byte	82
	.byte	101
	.byte	115
	.byte	101
	.byte	116
	.byte	32
	.byte	40
	.byte	72
	.byte	111
	.byte	108
	.byte	100
	.byte	32
	.byte	102
	.byte	111
	.byte	114
	.byte	32
	.byte	104
	.byte	97
	.byte	114
	.byte	100
	.byte	32
	.byte	114
	.byte	101
	.byte	115
	.byte	101
	.byte	116
	.byte	41
	.byte	59
	.byte	86
	.byte	44
	.byte	118
	.byte	51
	.byte	46
	.byte	52
	.byte	48
	.byte	46
	.byte	0
	.section	.rodata.63
	.align	4
l395:
	.byte	84
	.byte	79
	.byte	83
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	73
	.byte	77
	.byte	71
	.byte	0
	.section	.rodata.64
	.align	4
l396:
	.byte	77
	.byte	73
	.byte	83
	.byte	84
	.byte	69
	.byte	82
	.byte	89
	.byte	32
	.byte	67
	.byte	70
	.byte	71
	.byte	0
	.section	.bss.65
	.align	4
	.lcomm	l103,129
	.section	.bss.66
	.align	4
	.lcomm	l280,4
