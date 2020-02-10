# s0 *= -1
	.text
main:
	li	$s0,	420		# s0 = 420
	neg	$s0,	$s0		# s0 = -s0

	li	$v0,	1		# print integer
	move	$a0,	$s0		# at s0
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
