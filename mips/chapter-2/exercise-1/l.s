# for (t1 = 99; t1 > 0; v0 += t1--)
	.text
main:
	li	$v0,	0		# v0 = 0
	li	$t1,	99		# t1 = 99
for:
	blez	$t1,	end		# if (t1 <= 0) goto end
	add	$v0,	$v0,	$t1	# v0 += t1
	addi	$t1,	$t1,	-1	# t1--
	j	for			# goto for
end:

	move	$a0,	$v0		# a0 = v0
	li	$v0,	1		# print integer at a0
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
