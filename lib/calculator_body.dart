import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator_strategy/calculator_memory.dart';
import 'package:flutter_calculator/calculator_strategy/calculator_strategy.dart';
import 'package:flutter_calculator/calculator_widgets/calculator_button_action.dart';
import 'package:flutter_calculator/calculator_widgets/calculator_button_number.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorMemory memory = CalculatorMemory();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Calculator App - Sebastián Zárate"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 300,
                  child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 60,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.right,
                      controller: memory.inputText)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CalculatorActionButton(
                    calculator: memory,
                    calculatorStrategy: CalculatorACStrategy(memory),
                    buttonText: "AC",
                    color: const Color.fromARGB(255, 124, 124, 124),
                    operational: false,
                  ),
                  CalculatorActionButton(
                    calculator: memory,
                    buttonText: "CE",
                    calculatorStrategy: CalculatorCEStrategy(memory),
                    color: const Color.fromARGB(255, 124, 124, 124),
                    operational: false,
                  ),
                  CalculatorActionButton(
                    calculator: memory,
                    buttonText: "%",
                    calculatorStrategy: CalculatorPercentageStrategy(memory),
                    color: const Color.fromARGB(255, 124, 124, 124),
                    operational: false,
                  ),
                  CalculatorActionButton(
                    calculator: memory,
                    buttonText: "/",
                    calculatorStrategy: CalculatorDivisionStrategy(memory),
                    color: const Color.fromARGB(255, 255, 173, 50),
                    operational: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CalculatorNumberButton(
                    buttonText: "7",
                    calculator: memory,
                  ),
                  CalculatorNumberButton(
                    buttonText: "8",
                    calculator: memory,
                  ),
                  CalculatorNumberButton(
                    buttonText: "9",
                    calculator: memory,
                  ),
                  CalculatorActionButton(
                    calculator: memory,
                    buttonText: "*",
                    calculatorStrategy:
                        CalculatorMultiplicationStrategy(memory),
                    color: const Color.fromARGB(255, 255, 173, 50),
                    operational: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CalculatorNumberButton(
                    buttonText: "4",
                    calculator: memory,
                  ),
                  CalculatorNumberButton(
                    buttonText: "5",
                    calculator: memory,
                  ),
                  CalculatorNumberButton(
                    buttonText: "6",
                    calculator: memory,
                  ),
                  CalculatorActionButton(
                    calculator: memory,
                    buttonText: "-",
                    calculatorStrategy: CalculatorSubstractionStrategy(memory),
                    color: const Color.fromARGB(255, 255, 173, 50),
                    operational: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CalculatorNumberButton(
                        buttonText: "1",
                        calculator: memory,
                      ),
                      CalculatorNumberButton(
                        buttonText: "0",
                        calculator: memory,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CalculatorNumberButton(
                        buttonText: "2",
                        calculator: memory,
                      ),
                      CalculatorActionButton(
                        calculator: memory,
                        buttonText: ".",
                        calculatorStrategy: CalculatorPointStrategy(memory),
                        operational: false,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CalculatorNumberButton(
                        buttonText: "3",
                        calculator: memory,
                      ),
                      CalculatorActionButton(
                          calculatorStrategy: CalculatorResolveStrategy(memory),
                          operational: false,
                          calculator: memory,
                          buttonText: "="),
                    ],
                  ),
                  Column(
                    children: [
                      CalculatorActionButton(
                        calculator: memory,
                        buttonText: "+",
                        calculatorStrategy: CalculatorAdditionStrategy(memory),
                        size: const Size(70, 160),
                        color: const Color.fromARGB(255, 255, 173, 50),
                        operational: true,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
