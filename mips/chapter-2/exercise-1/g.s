# t8 = *a0
	.data
array:	.word	4, 20, 6, 9

	.text
main:
	la	$a0,	array		# a0 = array
	lw	$t8,	($a0)		# t8 = *a0

	li	$v0,	1		# print integer
	move	$a0,	$t8		# at t8
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
