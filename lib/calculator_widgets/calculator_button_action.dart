import 'package:flutter_calculator/calculator_strategy/calculator_strategy.dart';
import 'package:flutter_calculator/calculator_widgets/calculator_button.dart';

class CalculatorActionButton extends CalculatorGenericButton {
  final CalculatorStrategy calculatorStrategy;
  final bool operational;

  const CalculatorActionButton(
      {super.key,
      super.size,
      required super.buttonText,
      super.color,
      required super.calculator,
      required this.calculatorStrategy,
      required this.operational
      });

  @override
  void onPressed() {
    if(operational){
      calculator.setCalculatorOperation(calculatorStrategy);
    }else{
      calculator.setCalculatorAction(calculatorStrategy);
    }
  }
}
