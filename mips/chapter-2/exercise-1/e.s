# read to and echo t0
	.text
main:
	li	$v0,	5		# read integer to v0
	syscall

	move	$t0,	$v0		# t0 = v0

	li	$v0,	1		# print integer
	move	$a0,	$t0		# at t0
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
