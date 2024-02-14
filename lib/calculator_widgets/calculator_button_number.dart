import 'package:flutter_calculator/calculator_widgets/calculator_button.dart';

class CalculatorNumberButton extends CalculatorGenericButton{  
  const CalculatorNumberButton(
    {super.key,super.size,required super.buttonText, required super.calculator});

    @override
    void onPressed() {
      super.calculator.updateCalculatorOperationalMemory(double.parse(super.buttonText!));
    }
}