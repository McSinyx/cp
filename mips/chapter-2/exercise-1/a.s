# t3 = t4 + t5 - t6
	.text
main:
	li	$t4,	4		# t4 = 4
	li	$t5,	5		# t5 = 5
	li	$t6,	6		# t6 = 6

	add	$t3,	$t4,	$t5	# t3 = t4 + t5
	sub	$t3,	$t3,	$t6	# t3 -= t6

	li	$v0,	1		# print integer
	move	$a0,	$t3		# at t3
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
