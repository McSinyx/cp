# while (t0) { s1 += t0; t0 = *++t2; }
	.data
array:	.word	4, 2, 0, 6, 9

	.text
main:
	la	$t2,	array		# t2 = array
	lw	$t0,	($t2)		# t0 = *t2
	li	$s1,	0		# s1 = 0

while:
	beqz	$t0,	end		# if (!t0) goto end
	add	$s1,	$s1,	$t0	# s1 += t0
	addi	$t2,	$t2,	4	# t2++
	lw	$t0,	($t2)		# t0 = *t2
	j	while			# goto while
end:

	li	$v0,	1		# print integer
	move	$a0,	$s1		# at s1
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
