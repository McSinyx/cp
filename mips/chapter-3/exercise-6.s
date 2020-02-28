# print(hex(0b10101))
	.text
main:
	li	$t0,	21		# t0 = 0b10101
	li	$t1,	0		# t1 = 0
	li	$t9,	9		# t9 = 9

reverse:
	beqz	$t0,	done		# if (!t0) goto done
	andi	$t2,	$t0,	0xf	# t2 = t0 & 0xf
	sra	$t0,	$t0,	4	# t0 >>= 4
	sll	$t1,	$t1,	4	# t1 <<= 4
	add	$t1,	$t1,	$t2	# t1 += t2
	j	reverse			# goto reverse
done:

	li	$v0,	11		# print character
	li	$a0,	48		# 0
	syscall
	li	$v0,	11		# print character
	li	$a0,	120		# x
	syscall
	bnez	$t1,	print		# if (!t1) goto print
	li	$v0,	11		# print character
	li	$a0,	48		# 0
	syscall
	j	end			# goto end

print:
	beqz	$t1,	end		# if (!t1) goto end
	andi	$t2,	$t1,	0xf	# t2 = t1 & 0xf
	sra	$t1,	$t1,	4	# t1 >>= 4
	addi	$a0,	$t2,	48	# a0 = chr(t2), sort of
	ble	$t2,	$t9,	put	# if (t2 <= 9) goto put
	addi	$a0,	$a0,	7	# a0 += 7
put:
	li	$v0,	11		# print character at a0
	syscall
	j	print			# goto print
end:

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate
	syscall
