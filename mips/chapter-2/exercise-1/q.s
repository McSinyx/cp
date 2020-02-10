# s3 = s1 - s2 / s3
	.text
main:
	li	$s1,	69		# s1 = 69
	li	$s2,	20		# s2 = 20
	li	$s3,	4		# s3 = 4

	div	$s3,	$s2,	$s3	# s3 = s2 / s3
	sub	$s3,	$s1,	$s3	# s3 = s1 - s3

	li	$v0,	1		# print integer
	move	$a0,	$s3		# at s3
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
