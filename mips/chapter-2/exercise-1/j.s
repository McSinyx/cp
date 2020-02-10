# t7 = abs(t0)
	.text
main:
	li	$t0,	-420		# t0 = -420
	abs	$t7,	$t0		# t7 = abs(t0)

	li	$v0,	1		# print integer
	move	$a0,	$t7		# at t7
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
