// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
    @SCREEN
    D=A
    
    // assign 16XXX to address
    @address
    M=D 

    // if keyboard input > 0 goto fill black
    @KBD
    D=M
    @FILLBLACK
    D;JGT
    
    // set color to white
    @color
    M=0

    @COLOR_WORDS
    0;JMP

(FILLBLACK)
    @color
    M=-1

(COLOR_WORDS)
    @color
    D=M

    // use value of address to set A register and assign color as value
    @address
    A=M
    M=D

    // increment address by 1
    @address
    M=M+1
    D=M

    // count addresses up to 24576
    @24576
    D=D-A
    @COLOR_WORDS
    D;JLT
   
(FINALLY)
    @LOOP
    0;JMP