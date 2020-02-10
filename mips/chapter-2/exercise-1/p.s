# s2 = srt(s0**2 + 56) / a3
	.text
main:
	li	$s0,	420		# s0 = 420
	li	$a3,	69		# a3 = 69

	mul	$t0,	$s0,	$s0	# t0 = s0 ** 2
	addi	$a0,	$t0,	56	# a0 = t0 + 56
	jal	srt			# v0 = srt(a0)	# srt is undefined
	div	$s2,	$v0,	$a3	# s2 = v0 / a3

	li	$v0,	1		# print integer
	move	$a0,	$s0		# at s2
	syscall

	li	$v0,	11		# print character
	li	$a0,	10		# newline
	syscall

	li	$v0,	10		# terminate program run
	syscall
