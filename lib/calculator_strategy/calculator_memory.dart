import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator_strategy/calculator_strategy.dart';

class CalculatorMemory {
  bool _expectingNewInput = false;
  bool skipPointOperator = true;
  int pointOperator = 1;
  double _memoryOperational = 0;
  double _memorySaved = 0;
  CalculatorStrategy? _currentOperation;
  CalculatorStrategy? _currentAction;
  TextEditingController inputText = TextEditingController(text: "0");

  double get getCalculatorOperationalMemory {
    return _memoryOperational;
  }

  double get getCalculatorSavedMemory {
    return _memorySaved;
  }

  set setCalculatorSavedMemory(double number) {
    _memorySaved = number;
  }

  set setCalculatorOperationalMemory(double number) {
    _memoryOperational = number;
  }

  CalculatorMemory();

  void updateCalculatorInputText(String newText) {
    inputText.text = newText;
  }

  void setCalculatorOperation(CalculatorStrategy operation) {
    _currentOperation = operation;
    _expectingNewInput = true;
    skipPointOperator = true;
  }

  void setCalculatorAction(CalculatorStrategy action) {
    _currentAction = action;
    _currentAction!.operate();
  }

  void updateCalculatorOperationalMemory(double number) {
    int decimalPlaces = 0;

    //needs refactor oops
    if (_expectingNewInput) {
      _memorySaved = double.parse(inputText.text);
      _memoryOperational = number;
      _expectingNewInput = false;
    } else {
      if (skipPointOperator) {
        _memoryOperational = (_memoryOperational * 10) + number;
      } else {
        _memoryOperational =
            _memoryOperational + number / pow(10, pointOperator);
        pointOperator++;
        decimalPlaces = pointOperator - 1;
      }
    }

    updateCalculatorInputText(
        _memoryOperational.toStringAsFixed(decimalPlaces));
  }

  void operate() {
    (_currentOperation != null) ? _currentOperation!.operate() : () {};
    _memoryOperational = 0;
  }
}
