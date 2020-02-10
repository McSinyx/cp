# s3 = t2 / (s1 - 54321)
	.text
main:
	li	$t2,	69		# t2 = 69
	li	$s1,	54324		# s1 = 54324

	sub	$s1,	$s1,	54321	# s1 -= 54321
	div	$t3,	$t2,	$s1	# t3 = t2 / s1

	li	$v0,	1		# print integer
	move	$a0,	$t3		# at a0
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
