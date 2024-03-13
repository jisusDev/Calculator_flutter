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
  String resultValue = '0';
  String firstValue = '';
  String secondValue = '';
  double Function(double, double)? operation;
  String highlightOperator = '';

  void compute() {
    setState(() {
      resultValue = operation!
          .call(
            double.parse(firstValue.replaceAll(',', '.')),
            double.parse(secondValue.replaceAll(',', '.')),
          )
          .toStringAsFixed(2);

      firstValue = resultValue;
      secondValue = '';
      operation = null;
    });
  }

  void addOperand(double Function(double, double) operation) {
    if (firstValue.isEmpty) {
      return;
    }
    if (secondValue.isNotEmpty) {
      compute();
    }
    setState(() {
      this.operation = operation;
    });
  }

  void addNumber(String input) {
    highlightOperator = '';
    if (operation == null) {
      setState(() {
        firstValue += input;
        resultValue = firstValue;
      });
    } else {
      setState(() {
        secondValue += input;
        resultValue = secondValue;
      });
    }
  }

  void reset() {
    setState(() {
      resultValue = '0';
      firstValue = '';
      secondValue = '';
      operation = null;
    });
  }

  // Color changeColorOperator() {
  //   if (firstValue.isEmpty) {
  //     return const Color.fromRGBO(255, 149, 0, 1);
  //   } else {

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ViewResult(value: resultValue),
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
          onPressed: () {
            reset();
          },
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
          backgroundColor: firstValue.isEmpty
              ? const Color.fromRGBO(255, 149, 0, 1)
              : highlightOperator == '÷'
                  ? Colors.white
                  : const Color.fromRGBO(255, 149, 0, 1),
          textColor: firstValue.isEmpty
              ? Colors.white
              : highlightOperator == '÷'
                  ? const Color.fromRGBO(255, 149, 0, 1)
                  : Colors.white,
          onPressed: () {
            addOperand((p0, p1) => p0 / p1);
            setState(() => highlightOperator = '÷');
          },
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
          onPressed: () => addNumber('7'),
        ),
        CalculatorButton(
          text: '8',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () => addNumber('8'),
        ),
        CalculatorButton(
          text: '9',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () => addNumber('9'),
        ),
        CalculatorButton(
          text: '×',
          backgroundColor: firstValue.isEmpty
              ? const Color.fromRGBO(255, 149, 0, 1)
              : highlightOperator == '×'
                  ? Colors.white
                  : const Color.fromRGBO(255, 149, 0, 1),
          textColor: firstValue.isEmpty
              ? Colors.white
              : highlightOperator == '×'
                  ? const Color.fromRGBO(255, 149, 0, 1)
                  : Colors.white,
          onPressed: () {
            addOperand((p0, p1) => p0 * p1);
            setState(() => highlightOperator = '×');
          },
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
          onPressed: () => addNumber('4'),
        ),
        CalculatorButton(
          text: '5',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () => addNumber('5'),
        ),
        CalculatorButton(
          text: '6',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () => addNumber('6'),
        ),
        CalculatorButton(
          text: '-',
          backgroundColor: firstValue.isEmpty
              ? const Color.fromRGBO(255, 149, 0, 1)
              : highlightOperator == '-'
                  ? Colors.white
                  : const Color.fromRGBO(255, 149, 0, 1),
          textColor: firstValue.isEmpty
              ? Colors.white
              : highlightOperator == '-'
                  ? const Color.fromRGBO(255, 149, 0, 1)
                  : Colors.white,
          onPressed: () {
            addOperand((p0, p1) => p0 - p1);
            setState(() => highlightOperator = '-');
          },
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
          onPressed: () => addNumber('1'),
        ),
        CalculatorButton(
          text: '2',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () => addNumber('2'),
        ),
        CalculatorButton(
          text: '3',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () => addNumber('3'),
        ),
        CalculatorButton(
          text: '+',
          backgroundColor: firstValue.isEmpty
              ? const Color.fromRGBO(255, 149, 0, 1)
              : highlightOperator == '+'
                  ? Colors.white
                  : const Color.fromRGBO(255, 149, 0, 1),
          textColor: firstValue.isEmpty
              ? Colors.white
              : highlightOperator == '+'
                  ? const Color.fromRGBO(255, 149, 0, 1)
                  : Colors.white,
          onPressed: () {
            addOperand((p0, p1) => p0 + p1);
            setState(() => highlightOperator = '+');
          },
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
          onPressed: () => addNumber('0'),
        ),
        CalculatorButton(
          text: ',',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () => addNumber(','),
        ),
        CalculatorButton(
          text: '=',
          backgroundColor: const Color.fromRGBO(255, 149, 0, 1),
          textColor: Colors.white,
          onPressed: () {
            compute();
          },
        ),
      ],
    );
  }
}
