import 'package:flutter_calculator/calculator_strategy/calculator_memory.dart';

abstract class CalculatorStrategy {
  final CalculatorMemory _calculator;
  CalculatorStrategy(this._calculator);
  void operate();
}

class CalculatorAdditionStrategy extends CalculatorStrategy {
  CalculatorAdditionStrategy(super._calculator);

  @override
  void operate() {
    double result = _calculator.getCalculatorOperationalMemory +
        _calculator.getCalculatorSavedMemory;
    _calculator.setCalculatorSavedMemory = result;
    _calculator.updateCalculatorInputText(result.toStringAsFixed(2));
  }
}

class CalculatorSubstractionStrategy extends CalculatorStrategy {
  CalculatorSubstractionStrategy(super._calculator);

  @override
  void operate() {
    double result = super._calculator.getCalculatorSavedMemory -
        super._calculator.getCalculatorOperationalMemory;

    _calculator.setCalculatorSavedMemory = result;
    _calculator.updateCalculatorInputText(result.toStringAsFixed(2));
  }
}

class CalculatorMultiplicationStrategy extends CalculatorStrategy {
  CalculatorMultiplicationStrategy(super._calculator);

  @override
  void operate() {
    double result = _calculator.getCalculatorOperationalMemory *
        _calculator.getCalculatorSavedMemory;
    _calculator.setCalculatorSavedMemory = result;
    _calculator.updateCalculatorInputText(result.toStringAsFixed(2));
  }
}

class CalculatorDivisionStrategy extends CalculatorStrategy{
  CalculatorDivisionStrategy(super._calculator);
  
  @override
  void operate(){
    try{
      double result = super._calculator.getCalculatorSavedMemory / super._calculator.getCalculatorOperationalMemory;
      _calculator.setCalculatorSavedMemory = result;
    _calculator.updateCalculatorInputText(result.toStringAsFixed(2));
    }catch(e){
      super._calculator.updateCalculatorInputText("ERROR");
    }
    
  }
}

class CalculatorACStrategy extends CalculatorStrategy {
  CalculatorACStrategy(super._calculator);

  @override
  void operate() {
    _calculator.setCalculatorOperationalMemory = 0;
    _calculator.setCalculatorSavedMemory = 0;
    _calculator.pointOperator = 1;
    _calculator.skipPointOperator = true;
    _calculator.updateCalculatorInputText("0");
  }
}

class CalculatorCEStrategy extends CalculatorStrategy {
  CalculatorCEStrategy(super._calculator);

  @override
  void operate() {
    _calculator.setCalculatorOperationalMemory = 0;
    _calculator.pointOperator = 1;
    _calculator.skipPointOperator = true;
    _calculator.updateCalculatorInputText("0");
  }
}

class CalculatorResolveStrategy extends CalculatorStrategy {
  CalculatorResolveStrategy(super._calculator);

  @override
  void operate() {
    super._calculator.operate();
  }
}

class CalculatorPercentageStrategy extends CalculatorStrategy {
  CalculatorPercentageStrategy(super._calculator);

  @override
  void operate() {
    double result = (_calculator.getCalculatorOperationalMemory != 0
            ? _calculator.getCalculatorOperationalMemory
            : _calculator.getCalculatorSavedMemory) /
        100;

    _calculator.setCalculatorSavedMemory = result;
    _calculator.setCalculatorOperationalMemory = 0;
    _calculator.updateCalculatorInputText(result.toString());
  }
}

class CalculatorPointStrategy extends CalculatorStrategy{
  CalculatorPointStrategy(super._calculator);

  @override
  void operate(){
    _calculator.skipPointOperator = false;
    _calculator.pointOperator = 1;
  }
}