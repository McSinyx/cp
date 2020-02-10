# a0[4] = 32768
	.data
array:	.word	4, 2, 0, 6, 9

	.text
main:
	la	$a0,	array		# t0 = array
	li	$t1,	32768		# t1 = 32768
	sw	$t1,	16($a0)		# t0[4] = t1

	li	$v0,	1		# print integer
	lw	$a0,	16($a0)		# at t0[4]
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
