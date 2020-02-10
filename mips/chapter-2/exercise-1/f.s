# a0 = array
	.data
array:	.word	4, 20, 6, 9

	.text
main:

	li	$v0,	1		# print integer
	la	$a0,	array		# address of array
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
