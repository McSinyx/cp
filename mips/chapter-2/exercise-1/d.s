# print t3
	.text
main:
	li	$v0,	1		# print integer
	move	$a0,	$t3		# at t3
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
