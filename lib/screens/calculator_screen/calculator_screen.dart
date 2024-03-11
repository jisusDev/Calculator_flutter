import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: ViewResult(value: '0'),
          ),
          Column(
            children: [
              firstRowCalculatorButtons(),
              secondRowCalculatorButtons(),
              thirdRowCalculatorButtons(),
              fourthRowCalculatorButtons(),
            ],
          ),
        ],
      ),
    );
  }

  Widget firstRowCalculatorButtons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: 'C',
          backgroundColor: CupertinoColors.systemGrey3,
          textColor: Colors.black,
        ),
        CalculatorButton(
          text: '+/-',
          backgroundColor: CupertinoColors.systemGrey3,
          textColor: Colors.black,
        ),
        CalculatorButton(
          text: '%',
          backgroundColor: CupertinoColors.systemGrey3,
          textColor: Colors.black,
        ),
        CalculatorButton(
          text: '÷',
          backgroundColor: CupertinoColors.systemOrange,
          textColor: Colors.white,
        ),
      ],
    );
  }

  Widget secondRowCalculatorButtons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '7',
          backgroundColor: Color.fromARGB(255, 51,51,51),
          textColor: Colors.white,
        ),
        CalculatorButton(
          text: '8',
          backgroundColor: Color.fromARGB(255, 51,51,51),
          textColor: Colors.white,
        ),
        CalculatorButton(
          text: '9',
          backgroundColor: Color.fromARGB(255, 51,51,51),
          textColor: Colors.white,
        ),
        CalculatorButton(
          text: 'X',
          backgroundColor: CupertinoColors.systemOrange,
          textColor: Colors.white,
        ),
      ],
    );
  }

  Widget thirdRowCalculatorButtons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '4',
          backgroundColor: Color.fromARGB(255, 51,51,51),
          textColor: Colors.white,
        ),
        CalculatorButton(
          text: '5',
          backgroundColor: Color.fromARGB(255, 51,51,51),
          textColor: Colors.white,
        ),
        CalculatorButton(
          text: '6',
          backgroundColor: Color.fromARGB(255, 51,51,51),
          textColor: Colors.white,
        ),
        CalculatorButton(
          text: '-',
          backgroundColor: CupertinoColors.systemOrange,
          textColor: Colors.white,
        ),
      ],
    );
  }

  Widget fourthRowCalculatorButtons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          width: 156,
          text: '0',
          backgroundColor: Color.fromARGB(255, 51,51,51),
          textColor: Colors.white,
        ),
        CalculatorButton(
          text: ',',
          backgroundColor: Color.fromARGB(255, 51,51,51),
          textColor: Colors.white,
        ),
        CalculatorButton(
          text: '=',
          backgroundColor: CupertinoColors.systemOrange,
          textColor: Colors.white,
        ),
      ],
    );
  }
}

