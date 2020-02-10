# t0 = 0x7fffffff - 0x80000000
	.text
main:
	li	$t2,	-0x80000000	# t2 = 0x80000000
	li	$t1,	0x7fffffff	# t1 = 0x7fffffff
	add	$t0,	$t1,	$t2	# t0 = t1 - t2

	li	$v0,	1		# print integer
	move	$a0,	$t0		# at t0
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
