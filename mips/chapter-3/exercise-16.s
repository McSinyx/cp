# print(int('204', 5))
	.text
main:
	li	$t0,	0		# t0 = 0
	addi	$t0,	$t0,	2	# t0 += 2
	li	$t1,	25		# t1 = 5 * 5
	mul	$t0,	$t0,	$t1	# t0 *= t1
	addi	$t0,	$t0,	4	# t0 += 4

	li	$v0,	1		# print integer
	move	$a0,	$t0		# at t0
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate
	syscall
