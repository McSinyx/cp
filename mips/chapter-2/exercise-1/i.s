# print Hello, World!
	.data
hello:	.asciiz "Hello, World!\n"

	.text
main:
	li	$v0,	4		# print string
	la	$a0,	hello		# hello
	syscall

	li	$v0,	10		# terminate program run
	syscall
