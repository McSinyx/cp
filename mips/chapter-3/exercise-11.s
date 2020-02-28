# print -32 in 8-bit two-complement binary
	.text
main:
	li	$t0,	-32		# t0 = -32
	li	$t1,	0		# t1 = 0
	li	$t8,	8		# t8 = 8

reverse:
	beqz	$t8,	prefix		# if (!t8) goto prefix
	andi	$t2,	$t0,	1	# t2 = t0 & 1
	sra	$t0,	$t0,	1	# t0 >>= 1
	sll	$t1,	$t1,	1	# t1 <<= 1
	add	$t1,	$t1,	$t2	# t1 += t2
	addi	$t8,	$t8,	-1	# t8--
	j	reverse			# goto reverse

prefix:
	li	$v0,	11		# print character
	li	$a0,	48		# 0
	syscall
	li	$v0,	11		# print character
	li	$a0,	98		# b
	syscall
	li	$t8,	8		# t8 = 8

print:
	beqz	$t8,	end		# if (!t8) goto end
	li	$v0,	1		# print integre
	andi	$a0,	$t1,	1	# a0 = t1 & 1
	syscall
	sra	$t1,	$t1,	1	# t1 >>= 1
	addi	$t8,	$t8,	-1	# t8--
	j	print			# goto print

end:
	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate
	syscall
