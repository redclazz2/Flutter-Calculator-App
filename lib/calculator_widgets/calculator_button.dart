import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator_strategy/calculator_memory.dart';

abstract class CalculatorGenericButton extends StatelessWidget {
  final CalculatorMemory calculator;
  final String? buttonText;
  final Size? size;
  final Color? color;
  final TextStyle textStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1),
      fontSize: 25,
      fontWeight: FontWeight.bold);

  const CalculatorGenericButton(
      {super.key,
      this.buttonText,
      this.size,
      this.color,
      required this.calculator});

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? const Color.fromARGB(255, 73, 71, 71),
            minimumSize: size ?? const Size(70, 70),
            padding: EdgeInsets.zero,
          ),
          child: Text(
            buttonText ?? "",
            style: textStyle,
          ),
        ));
  }
}