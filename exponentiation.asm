# exponentiation in MIPS assembly:
# Calculate 3³:
main:
      addi $t0, $zero, 3 # t0 = 3 --> base
      addi $t1, $zero, 1 # t1 = 1 --> multi. count. (start with 1 for a total of 3 iterations)
      addi $t2, $zero, 3 # t2 receives the exponent (3)
      addi $t3, $zero, 1 # t3 = 1 --> exp. count (start with 1 for a total of 3 iterations)
      add $t4, $t4, $t0 # t4 = result
      jal exp
mult:
      beq $t1, $t2, exp #beq --> compares if $t1 (counter) equals t2 (the exponent)
      add $t4, $t4, $t4 # t4 + t4
      addi $t1, $t1, 1 # count++
      j mult # repeat loop
exp:
      addi $t1, $t1, -2 # reset multi. count. to 1
      addi $t3, $zero, 1 # expCount++
      beq $t3, $t2, end # the exponent counter reached the exponent value? go to "end"
      j mult
end:
      add $v0, $t4, $zero # v0 receives the result of 3³
