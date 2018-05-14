# 2's Complement

VHDL code for a circuit to calculate the 2's complement of 3-bit input.
The inputs are X, Y, Z (MSB to LSB) and the outputs are F1, F2, F3
(MSB to LSB). V is valid flag where 0 signifies valid operation and 1
signifies invalid operation.

## Truth Table
 X | Y | Z | *F1* | *F2* | *F3* | **V**
---|---|---|:----:|:----:|:----:|:----:
 0 | 0 | 0 |  0   |  0   |  0   |  0
 0 | 0 | 1 |  1   |  1   |  1   |  0
 0 | 1 | 0 |  1   |  1   |  0   |  0
 0 | 1 | 1 |  1   |  0   |  1   |  0
 1 | 0 | 0 |  1   |  0   |  0   |  1
 1 | 0 | 1 |  0   |  1   |  1   |  0
 1 | 1 | 0 |  0   |  1   |  0   |  0
 1 | 1 | 1 |  0   |  0   |  1   |  0
