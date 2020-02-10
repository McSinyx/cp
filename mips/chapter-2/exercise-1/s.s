# s5 *= pi
	.text
main:
	li	$s5,	420		# s5 = 420
	mul	$s5,	$s5,	3	# s5 *= 3

	li	$v0,	1		# print integer
	move	$a0,	$s5		# at s5
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
