# RPN calculator

## Setup
To use the Calculator, follow the instructions
```
    git clone git@github.com:duduribeiro/rpn_calculator.git
    cd rpn_calculator
    # run the calculator
    bin/calculator
    # run the tests
    rspec .
```
## The code
with a main ruby in a bin and a lib folder, it's easy to move the code to a future gem project.
The main ruby will only call the Runner class (Responsible to inject the Engine to the Interface and start the calculation via interface).
The default engine is the RPN calculator and the default interface is the CLI.
The CLI interface ( lib/calculator/interfaces/cli.rb ) will read the STDIN and send the input to the engine to process it.
The RPN engine will be called from the interface and will receive the input and process it and returns the calculation to the interface if applicable.
To make the calculation, the engine will use the Operators. Since it is not attached with the engine, it is easy to create another operator and use it, or
create a different engine that uses the same operators.

The code was created based on a way to be easy to create new engines (like a normal or scientific calculator), interface (like a file) and custom operators (
  global operators (that works for all engines (like +, -, etc)) or interface specific operator (like 'q' from the CLI)
  ). It only needs to create the specific class and register it
