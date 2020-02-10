# sp -= 16
	.text
main:
	addi	$sp,	$sp,	-16	# sp -= 16, may underflow

	li	$v0,	1		# print integer
	move	$a0,	$sp		# at sp
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
