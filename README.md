## Min-Max Calculator
Assembly program that would find the minimum and maximum value of a sequence of 10 numbers
> Author: Will Nigel De Jesus

## Task
You are to create an assembly program that would find the minimum and maximum value of a sequence of 10 numbers.


## Procedure
The program should accept 10 numbers, and display the largest element and the smallest
element in the sequence. Additionally, it should display the indices (relative to the array) of the
first occurence of the largest and smallest elements. You should be using arrays.


## Usage
Compiling/Running:
> nasm -f elf minmax.asm
> 
> gcc minmax.o -o minmax -m32
> 
> ./minmax

Required lib: gcc-multilib g++multilib
Installation:
> sudo apt-get install gcc-multilib g++-multilib