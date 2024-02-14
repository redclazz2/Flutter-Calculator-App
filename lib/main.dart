import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator_body.dart';

void main() {
  runApp(const Calculator());
}

/*
TODO:
OPTIONAL:
1. Refactor memory method updateCalculatorOperationalMemory
   to remove if statement nesting.
2. Refactor calculator strats to avoid repeating variable resetting.
3. Find a way to only show important decimals and round results.
  - Partially fixed with stringAs().
4. Make the TextInput actually align with the buttons.
*/