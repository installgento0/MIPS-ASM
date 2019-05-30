.data
      error: .asciiz "Error: cannot divide by 0"
# subtraction in MIPS assembly:
# sub. a value from a reg. with another reg. --> sub
# sub $REG $REG2 $REG3
#    result <-- (val1 - val2)
# eg:  sub $t0, $t1, $t2  --> subtract t1 by t2
# eg2: sub $t0, $zero, $t0 --> turn the value of t0 to negative
# sub. a value directly from a register --> subi
# subi $t0, $t0, 1   (or any number up to 2^31 = 2147483648)
# Divide 25 by 5:
.text
main:
      addi $t0, $zero, 25 # t0 = 25 --> dividend
      addi $t1, $zero, 5 # t1 = 5 --> divider
      add $t2, $zero, $zero # t2 --> remainder
      add $t3, $zero, $zero # t3 --> check in case the remainder > 0
      add $t4, $zero, $zero # t4 --> result
      jal div
div:
      beq $t1, $zero, exception # beq --> compares if $t1 equals zero if true, goto "exception"
      beq $t0, $zero, end # compares t0 to zero, if true, the remainder is 0 -> jump to end
      bne $t3, $zero, end # checks if t3 is NOT equal to 0, if t3 equals 1, jump to end
      subi $t0, $t0, 5
      slti $t3, $t0, 5 # slti --> checks if $t0 < 5 if true, $t3 receives 1 else, $t3 receives 0
      add $t2, $t0, $zero # t2 receives the remainder
      add $t4, $t1, $zero # t4 receives the result of 25/5 (n of times t0 was subtracted by t1
      j div # repeat loop
exception:
      li $v0, 4 # system call code for printing string (4)    -  memory [ 0-4   4-8   8-12 ...]
#                                                                        error
      la $a0, error # load address of string to be printed into $a0
      syscall
end:
      add $v0, $t4, $zero # v0 receives the result of 25/5
      add $v1, $t2, $zero # v1 receives the remainder of 25/5 (integer/integer division)*
# *So, if t0 = 10 and t1 = 3 ==> t2 = 3
# i just want a cute gf to cuddle w/ me while i write memecode ;-; 
