# s4 <<= 3
	.text
main:
	li	$s4,	420		# s4 = 420
	sll	$s4,	$s4,	3	# s4 <<= 3

	li	$v0,	1		# print integer
	move	$a0,	$s4		# at s4
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
