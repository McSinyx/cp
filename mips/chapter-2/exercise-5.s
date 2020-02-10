# t0 = s0/8 - s1*2 + s2
	.text
main:
	li	$s0,	69		# s0 = 20
	li	$s1,	4		# s1 = 4
	li	$s2,	20		# s2 = 20

	sra	$t0,	$s0,	3	# t0 = s0 >> 3
	sll	$t1,	$s1,	1	# t1 = s1 << 1
	sub	$t0,	$t0,	$t1	# t0 -= t1
	add	$t0,	$t0,	$s2	# t0 += s2

	li	$v0,	1		# print integer
	move	$a0,	$t0		# at t0
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall


	li	$v0,	10		# terminate
	syscall
