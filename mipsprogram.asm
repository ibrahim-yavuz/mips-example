.data
array1: .asciiz "CGTCGTAAAC"
array2: .asciiz "TACTACTACG"
array3: .asciiz "TCGCGCTAGC"
array4: .asciiz "TATTTACGAA"
array5: .asciiz "ATGATGATGC"
.text
.globl main
main:
    la $t1, array1
    la $t2, array2
    la $t3, array3
    la $t4, array4
    la $t5, array5
    la $a0, 0($t1)
    la $a1, 0($t1)
    la $a3, 0($t1)
    la $s7, 0($a0)
    li $t6, 19
    li $t7, -19
    li $t8, 4
    li $t9, -4
    li $s0, 0 #ilk_döngü
    li $s1, 0 #ikinci_döngü    
    li $s2, 5
    li $s3, 0 #ucuncu_dongu
    li $s4, 10
For_1:
    bge		$s0, $s2, end	# if $s0 >= $s2 then target
    j For_2
    continue:
    addi $s0, $s0, 1
    addi	$s1, $s0, 0			# $s1 = s0 + 0
    la $a0, 11($a0)
    la $a1, ($a0)
    la $a3, 0($a0)
    la $s7, 0($a0)
    j For_1
For_2:
    bge		$s1, $s2, continue	# if $s1 >= $s2 then target
    j For_3
    continue_2:
    beq		$s3, 10, end	# if $t0 == $t1 then target

    #beq $s0, 5, ikinci
    #ikinci: beq $s1, 5, ucuncu
    #ucuncu:
    #    li $s5, 0
    #    li $s6, 0
    #    j end       

    la $a0, 0($s7)
    la $a1, 11($a1)
    la $a3, 0($a1)
    li $s3, 0 #ucuncu_dongu
    addi $s1, $s1, 1
    j For_2
For_3:
    bge		$s3, $s4, continue_2	# if $s3 >= $s4 then target
    lb $k0, 0($a0)
    lb $k1, 0($a3)
    sub	    $a2, $k0, $k1	# $a2 = $a0 - $a3
    beq		$a2, $t6, continue_3	
    beq		$a2, $t7, continue_3	
    beq		$a2, $t8, continue_3	
    beq		$a2, $t9, continue_3
    j continue_2  
    continue_3:
    la $a3, 1($a3)
    la $a0, 1($a0)
    addi $s3, $s3, 1
    j For_3
end:
    li $v0, 5
    syscall