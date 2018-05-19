# Circuit 2

VHDL code for the Boolean equation:
`F(X,Y,Z) = X~Y + YZ`

## Truth Table
 X | Y | Z |  F
---|---|---|:---:
 0 | 0 | 0 |  0
 0 | 0 | 1 |  0
 0 | 1 | 0 |  0
 0 | 1 | 1 |  1
 1 | 0 | 0 |  1
 1 | 0 | 1 |  1
 1 | 1 | 0 |  0
 1 | 1 | 1 |  1

### Dataflow Design Style

#### [Boolean Equation](dds-bool.vhd)

#### [Conditional Signal Assignment](dds-csa.vhd)

#### [Selected Signal Assignment](dds-ssa.vhd)

### [Behavioral Design Style](bds.vhd)

### [Structural Design Style](sds.vhd)
