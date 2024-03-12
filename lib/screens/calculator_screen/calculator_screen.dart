import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

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

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
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
              fivethRowCalculatorButtons(),
            ],
          ),
        ],
      ),
    );
  }

  Widget firstRowCalculatorButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: 'C',
          backgroundColor: const Color.fromRGBO(199, 199, 204, 1),
          textColor: Colors.black,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '±',
          backgroundColor: const Color.fromRGBO(199, 199, 204, 1),
          textColor: Colors.black,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '%',
          backgroundColor: const Color.fromRGBO(199, 199, 204, 1),
          textColor: Colors.black,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '÷',
          backgroundColor: const Color.fromRGBO(255, 149, 0, 1),
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget secondRowCalculatorButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '7',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '8',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '9',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '×',
          backgroundColor: const Color.fromRGBO(255, 149, 0, 1),
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget thirdRowCalculatorButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '4',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '5',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '6',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '-',
          backgroundColor: const Color.fromRGBO(255, 149, 0, 1),
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget fourthRowCalculatorButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '1',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '2',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '3',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '+',
          backgroundColor: const Color.fromRGBO(255, 149, 0, 1),
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget fivethRowCalculatorButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          width: 156,
          text: '0',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: ',',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '=',
          backgroundColor: const Color.fromRGBO(255, 149, 0, 1),
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
