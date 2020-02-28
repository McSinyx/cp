# t0 = 0b11001, using only bit shift and add
	.text
main:
	li	$t0,	0		# t0 = 0
	addi	$t0,	$t0,	1	# t0++
	sll	$t0,	$t0,	1	# t0 <<= 1
	addi	$t0,	$t0,	1	# t0++
	sll	$t0,	$t0,	3	# t0 <<= 3
	addi	$t0,	$t0,	1	# t0++

	li	$v0,	1		# print integer
	move	$a0,	$t0		# at t0
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate
	syscall
