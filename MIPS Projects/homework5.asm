# Snake Game
# Yash Hooda
# April 09, 2022
#
# Instructions: 
#         set pixel dim to 4x4
#         set display dim to 256x256
# Connect to MIPS and run

# set up some constants
# width of screen in pixels
# 256 / 4 = 64
.eqv WIDTH 64
# height of screen in pixels
.eqv HEIGHT 64
# memory address of pixel (0, 0)
.eqv MEM 0x10010000 

# colors
.eqv	RED 	0x00FF0000
.eqv	GREEN 	0x0000FF00
.eqv	BLUE	0x000000FF
.eqv 	WHITE	0x00FFFFFF
.eqv	YELLOW	0x00FFFF00
.eqv	CYAN	0x0000FFFF
.eqv	MAGENTA	0x00FF00FF

.data
colors:	 .word	MAGENTA, CYAN, YELLOW, BLUE, GREEN, RED

.text
main:
	# draw a red  pixel in the center of the screen
	addi 	$a0, $0, WIDTH    # a0 = X = WIDTH/2
	sra 	$a0, $a0, 1
	addi 	$a1, $0, HEIGHT   # a1 = Y = HEIGHT/2
	sra 	$a1, $a1, 1
	addi 	$a2, $0, RED  # a2 = red (ox00RRGGBB)
	jal 	draw_pixel
	
	#draw a red one to the right
	addi 	$a0, $a0, 1
	addi 	$a2, $0, RED 
	jal 	draw_pixel
	
	#draw a green one to the right
	addi	$a0, $a0, 1
	addi	$a2, $0, GREEN
	jal	draw_pixel
	
	#draw a blue one to the right
	addi	$a0, $a0, 1
	addi	$a2, $0, BLUE
	jal	draw_pixel
	
	#draw a White one to the right
	addi 	$a0, $a0, 1
	addi 	$a2, $0, WHITE
	jal 	draw_pixel
	
	#draw a Yellow one to the right
	addi	$a0, $a0, 1
	addi	$a2, $0, YELLOW
	jal	draw_pixel
	
	#draw a Cyan one to the right
	addi	$a0, $a0, 1
	addi	$a2, $0, CYAN
	jal	draw_pixel
	
	#draw a Magenta one to the right
	addi	$a0, $a0, 1
	addi	$a2, $0, MAGENTA
	jal	draw_pixel
	
	#draw a red one to the bottom
	addi 	$a1, $a1, 1
	addi 	$a2, $0, RED 
	jal 	draw_pixel
	
	#draw a green one to the bottom
	addi	$a1, $a1, 1
	addi	$a2, $0, GREEN
	jal	draw_pixel
	
	#draw a blue one to the bottom
	addi	$a1, $a1, 1
	addi	$a2, $0, BLUE
	jal	draw_pixel
	
	#draw a White one to the bottom
	addi 	$a1, $a1, 1
	addi 	$a2, $0, WHITE
	jal 	draw_pixel
	
	#draw a Yellow one to the bottom
	addi	$a1, $a1, 1
	addi	$a2, $0, YELLOW
	jal	draw_pixel
	
	#draw a Cyan one to the bottom
	addi	$a1, $a1, 1
	addi	$a2, $0, CYAN
	jal	draw_pixel
	
	#draw a Magenta one to the bottom
	addi	$a1, $a1, 1
	addi	$a2, $0, MAGENTA
	jal	draw_pixel
	
	#draw a red one to the left
	addi 	$a0, $a0, -1
	addi 	$a2, $0, RED 
	jal 	draw_pixel
	
	#draw a green one to the left
	addi	$a0, $a0, -1
	addi	$a2, $0, GREEN
	jal	draw_pixel
	
	#draw a blue one to the left
	addi	$a0, $a0, -1
	addi	$a2, $0, BLUE
	jal	draw_pixel
	
	#draw a White one to the left
	addi 	$a0, $a0, -1
	addi 	$a2, $0, WHITE
	jal 	draw_pixel
	
	#draw a Yellow one to the left
	addi	$a0, $a0, -1
	addi	$a2, $0, YELLOW
	jal	draw_pixel
	
	#draw a Cyan one to the left
	addi	$a0, $a0, -1
	addi	$a2, $0, CYAN
	jal	draw_pixel
	
	#draw a Magenta one to the left
	addi	$a0, $a0, -1
	addi	$a2, $0, MAGENTA
	jal	draw_pixel
	
	#draw a red one to the top
	addi 	$a1, $a1, -1
	addi 	$a2, $0, RED 
	jal 	draw_pixel
	
	#draw a green one to the top
	addi	$a1, $a1, -1
	addi	$a2, $0, GREEN
	jal	draw_pixel
	
	#draw a blue one to the top
	addi	$a1, $a1, -1
	addi	$a2, $0, BLUE
	jal	draw_pixel
	
	#draw a White one to the top
	addi 	$a1, $a1, -1
	addi 	$a2, $0, WHITE
	jal 	draw_pixel
	
	#draw a Yellow one to the top
	addi	$a1, $a1, -1
	addi	$a2, $0, YELLOW
	jal	draw_pixel
	
	#draw a Cyan one to the top
	addi	$a1, $a1, -1
	addi	$a2, $0, CYAN
	jal	draw_pixel
	
	#draw a Magenta one to the top
	addi	$a1, $a1, -1
	addi	$a2, $0, MAGENTA
	jal	draw_pixel
	
exit:	li	$v0, 10
	syscall

#################################################
# subroutine to draw a pixel
# $a0 = X
# $a1 = Y
# $a2 = color
draw_pixel:
	# s1 = address = MEM + 4*(x + y*width)
	mul	$s1, $a1, WIDTH   # y * WIDTH
	add	$s1, $s1, $a0	  # add X
	mul	$s1, $s1, 4	  # multiply by 4 to get word offset
	add	$s1, $s1, MEM	  # add to base address
	sw	$a2, 0($s1)	  # store color at memory location
	jr 	$ra
