# t0 = (s1 - s0 / s2) * s4
	.text
main:
	li	$s1,	4		# s1 = 4
	li	$s0,	20		# s0 = 20
	li	$s2,	6		# s2 = 6
	li	$s4,	9		# s4 = 9

	div	$t0,	$s0,	$s2	# t0 = s0 / s2
	sub	$t0,	$s1,	$t0	# t0 = s1 - t0
	mul	$t0,	$t0,	$s4	# t0 *= s4

	li	$v0,	1		# print integer
	move	$a0,	$t0		# at t0
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate
	syscall
