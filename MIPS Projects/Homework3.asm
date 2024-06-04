#Author: Yash Hooda
#Date Created: 03/12/2022
#BMI Calculator Homework 3

#Initialize program
.data
height:		.double  0.0
weight:		.double  0.0
bmi:		.double  0.0
askname:	.asciiz "What is your name?\n"
entername:	.space 20
askheight:	.asciiz "Please enter your height in inches: \n"
askweight:	.asciiz "Now enter your weight in pounds (round to a whole number): \n"
yourbmi:	.asciiz ", your bmi is: "
underweight:   .asciiz "This is underweight. \n"
normal: 	.asciiz "This is normal. \n"
overweight:	.asciiz "This is overweight. \n"
obese:		.asciiz "This is obese. \n"

.text
main:
       #Get user's name
	li 	$v0, 8
	la	$a0, entername
	li	$a1, 20
	syscall
	
	#Ask name
	li  	$v0, 4
	la  	$a0, askname
	syscall
	
	#Displays name
	li	$v0, 4
	la	$a0, entername
	syscall
	
	#Prompt user to enter height in inches
	li 	$v1, 5
	la	$a1, askheight
	syscall
	
	#Get height in inches
	li	$v1, 6
	syscall
	
	#Store the result in  $t0
	move 	$t0, $v1
	
	
	#Prompt user to enter weight in pounds
	li 	$v1, 5
	la	$a2, askweight
	syscall
	
	#Get weights in pounds
	li	$v1, 6
	syscall
	
	#Store the result in  $t1
	move 	$t1, $v1
	
	#Calculate BMI
	mult 	$t1, $t1, 703
	div 	$t3, $t1, $t0
	
	#Displays name
	li	$v0, 4
	la	$a0, entername
	syscall
	
	#Displays bmi
	li	$v1, 4
	la	$a1, yourbmi
	li 	$t3
	syscall
	
	#Figure out bmi
	slt `	$5, $t3, 18.5
	beq	$5, $0, else
	li	$v0, 4
	la	$a0, underweight
	j 	loop
	
	li	$v0, 10
	syscall
