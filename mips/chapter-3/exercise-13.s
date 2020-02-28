# print(int('204', 8))
	.text
main:
	li	$t0,	0		# t0 = 0
	addi	$t0,	$t0,	2	# t0 += 2
	sll	$t0,	$t0,	6	# t0 *= 8 * 8
	addi	$t0,	$t0,	4	# t0 += 4

	li	$v0,	1		# print integer
	move	$a0,	$t0		# at t0
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate
	syscall
