# subtraction in MIPS assembly:
# sub. a value from a reg. with another reg. --> sub
# sub $REG $REG2 $REG3
#    result <-- (val1 - val2)
# eg:  sub $t0, $t1, $t2  --> subtract t1 by t2
# eg2: sub $t0, $zero, $t0 --> turn the value of t0 to negative
# sub. a value directly from a register --> subi
# subi $t0, $t0, 1   (or any number up to 2^31 = 2147483648)
# Divide 25 by 5:
main:
	addi $a0, $zero, 25 # t0 = 25 --> dividend
	addi $a1, $zero, 5 # t1 = 5 --> divider
div:
	beq $v0,$a1,tora
	addi $v0, $v0, 1
	sub $a0,$a0,$a1
	j div	
tora:
	jr $ra
