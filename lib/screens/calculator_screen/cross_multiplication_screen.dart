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
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          rowButtonNumbers('1', '2', '3'),
          rowButtonNumbers('4', '5', '6'),
          rowButtonNumbers('7', '8', '9'),
          dualButtonBottom(),
        ],
      ),
    );
  }

  Row dualButtonBottom() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '<-',
          backgroundColor: Color.fromRGBO(255, 149, 0, 1),
          textColor: Colors.white,
        ),
        CalculatorButton(
          text: '0',
          backgroundColor: Color.fromRGBO(199, 199, 204, 1),
          textColor: Colors.black,
        ),
        CalculatorButton(
          text: '->',
          backgroundColor: Color.fromRGBO(255, 149, 0, 1),
          textColor: Colors.white,
        ),
      ],
    );
  }

  Row rowButtonNumbers(String numLeft, String numCenter, String numRight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: numLeft,
          backgroundColor: const Color.fromRGBO(199, 199, 204, 1),
          textColor: Colors.black,
        ),
        CalculatorButton(
          text: numCenter,
          backgroundColor: const Color.fromRGBO(199, 199, 204, 1),
          textColor: Colors.black,
        ),
        CalculatorButton(
          text: numRight,
          backgroundColor: const Color.fromRGBO(199, 199, 204, 1),
          textColor: Colors.black,
        ),
      ],
    );
  }
}
