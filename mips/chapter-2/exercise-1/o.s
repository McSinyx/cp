# s1 *= a0
	.text
main:
	li	$s1,	420		# s1 = 420
	li	$a0,	69		# a0 = 69
	mul	$s1,	$s1,	$a0	# s1 *= a0

	li	$v0,	1		# print integer
	move	$a0,	$s1		# at s1
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
