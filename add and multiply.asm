# addition in MIPS assembly:
# add a value from a reg. with another reg. --> add
# add $REG $REG2 $REG3
#    result <-- val1 + val2
# eg:  add $t0, $t1, $t2
# eg2: add $t0, $zero, $zero --> same as: addi $t0, $zero, 0
# add a value directly to a register --> addi
# addi $t0, $t0, 1   (or any number up to 2^31 = 2147483648)
# Multiply 5 by 5:
main:
      addi $t0, $zero, 5 # t0 = 5 --> accumulator
      addi $t1, $zero, 4 # t1 = 4 --> count. in this case, in order to stop at 25, instead of
      # initializing the counter with 5, do it with 4 since BEQ can't compare with integers, only register values
      # and $zero
      jal mult
mult:
      beq $t1, $zero, end #beq --> compares if $reg1 equals zero if true, goto "end"
      addi $t0, $t0, 5 # t0 + 5
      addi $t1, $t1, -1 # count--
      j mult # repeat loop
end:
      add $v0, $t0, $zero # v0 receives the result of 5*5
