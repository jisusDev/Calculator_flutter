import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CrossMultiplicationScreen extends StatelessWidget {
  const CrossMultiplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          ButtonChangeScreen(
            icon: Icons.calculate_outlined,
            text: 'Calculadora',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextfieldCalculator(labelText: 'Valor X1'),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextfieldCalculator(labelText: 'Valor Y1'),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: TextfieldCalculator(labelText: 'Valor X2'),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextfieldCalculator(labelText: 'Valor Y2'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                rowButtonNumbers('1', '2', '3'),
                rowButtonNumbers('4', '5', '6'),
                rowButtonNumbers('7', '8', '9'),
                rowButtonNumbers(',', '0', '='),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row rowButtonNumbers(String numLeft, String numCenter, String numRight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: numLeft,
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.black,
        ),
        CalculatorButton(
          text: numCenter,
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.black,
        ),
        CalculatorButton(
          text: numRight,
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.black,
        ),
      ],
    );
  }
}
