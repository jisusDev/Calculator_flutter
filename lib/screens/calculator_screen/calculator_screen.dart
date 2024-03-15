import 'package:calculator_app/screens/screens.dart';
import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          ButtonChangeScreen(
            icon: Icons.change_circle_outlined,
            text: 'Regla de Tres',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CrossMultiplicationScreen(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
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
  //variables para los metodos
  String resultValue = '0';
  String firstValue = '';
  String secondValue = '';
  double Function(double, double)? operation;
  String highlightOperator = '';

  //metodo realiza funcion de igualdad con los valores introducidos
  void compute() {
    setState(() {
      double result = operation!.call(
        double.parse(firstValue.replaceAll(',', '.')),
        double.parse(secondValue.replaceAll(',', '.')),
      );
      if (result == result.floor()) {
        resultValue = result.toInt().toString();
      } else {
        resultValue = result.toStringAsFixed(2);
      }
      firstValue = resultValue;
      secondValue = '';
      operation = null;
    });
  }

  //agregar operador entre los dos valores, y funcion de igualdad cuando se preciona otro operador
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

  //agregar cada numero a firstValue o secondValue
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

  //formatear el valores a su estado default
  void reset() {
    setState(() {
      resultValue = '0';
      firstValue = '';
      secondValue = '';
      operation = null;
    });
  }

  //funcionalidad del btn +/-
  void plussLess() {
    setState(() {
      if (firstValue.isNotEmpty && secondValue.isEmpty) {
        if (firstValue.startsWith('-')) {
          firstValue = firstValue.substring(1);
        } else {
          firstValue = '-$firstValue';
        }
        resultValue = firstValue;
      } else if (firstValue.isEmpty && secondValue.isNotEmpty) {
        if (secondValue.startsWith('-')) {
          secondValue = secondValue.substring(1);
        } else {
          secondValue = '-$secondValue';
        }
        resultValue = secondValue;
      }
    });
  }

  //funcionalidad del btn porcentaje
  void calculatePercentage() {
    if (firstValue.isNotEmpty && secondValue.isEmpty) {
      setState(() {
        final double value = double.parse(resultValue.replaceAll(',', '.'));
        resultValue = (value / 100).toStringAsFixed(3);
      });
    }
  }

  // cambiar el highklight de los btn operators cuando este activo o no
  // color del background
  Color changeBackgroundColorOperator(String highlightOperator) {
    if (firstValue.isEmpty) {
      return const Color.fromRGBO(255, 149, 0, 1);
    } else {
      return this.highlightOperator == highlightOperator
          ? Colors.white
          : const Color.fromRGBO(255, 149, 0, 1);
    }
  }

  // color del text
  Color changeTextColorOperator(String highlightOperator) {
    if (firstValue.isEmpty) {
      return Colors.white;
    } else {
      return this.highlightOperator == highlightOperator
          ? const Color.fromRGBO(255, 149, 0, 1)
          : Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = (screenWidth - 16 * 5) / 4;
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
              firstRowCalculatorButtons(buttonWidth),
              secondRowCalculatorButtons(buttonWidth),
              thirdRowCalculatorButtons(buttonWidth),
              fourthRowCalculatorButtons(buttonWidth),
              fivethRowCalculatorButtons(buttonWidth),
            ],
          ),
        ],
      ),
    );
  }

  Widget firstRowCalculatorButtons(double buttonWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: resultValue == '0' ? 'AC' : 'C',
          backgroundColor: const Color.fromRGBO(199, 199, 204, 1),
          textColor: Colors.black,
          width: buttonWidth,
          onPressed: () {
            reset();
          },
        ),
        CalculatorButton(
          text: '+/-',
          backgroundColor: const Color.fromRGBO(199, 199, 204, 1),
          textColor: Colors.black,
          width: buttonWidth,
          onPressed: () {
            plussLess();
          },
        ),
        CalculatorButton(
          text: '%',
          backgroundColor: const Color.fromRGBO(199, 199, 204, 1),
          textColor: Colors.black,
          onPressed: () {
            calculatePercentage();
          },
        ),
        CalculatorButton(
          text: '÷',
          backgroundColor: changeBackgroundColorOperator('÷'),
          textColor: changeTextColorOperator('÷'),
          width: buttonWidth,
          onPressed: () {
            addOperand((p0, p1) => p0 / p1);
            setState(() => highlightOperator = '÷');
          },
        ),
      ],
    );
  }

  Widget secondRowCalculatorButtons(double buttonWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '7',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () => addNumber('7'),
        ),
        CalculatorButton(
          text: '8',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () => addNumber('8'),
        ),
        CalculatorButton(
          text: '9',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () => addNumber('9'),
        ),
        CalculatorButton(
          text: '×',
          backgroundColor: changeBackgroundColorOperator('×'),
          textColor: changeTextColorOperator('×'),
          width: buttonWidth,
          onPressed: () {
            addOperand((p0, p1) => p0 * p1);
            setState(() => highlightOperator = '×');
          },
        ),
      ],
    );
  }

  Widget thirdRowCalculatorButtons(double buttonWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '4',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () => addNumber('4'),
        ),
        CalculatorButton(
          text: '5',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () => addNumber('5'),
        ),
        CalculatorButton(
          text: '6',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () => addNumber('6'),
        ),
        CalculatorButton(
          text: '-',
          backgroundColor: changeBackgroundColorOperator('-'),
          textColor: changeTextColorOperator('-'),
          width: buttonWidth,
          onPressed: () {
            addOperand((p0, p1) => p0 - p1);
            setState(() => highlightOperator = '-');
          },
        ),
      ],
    );
  }

  Widget fourthRowCalculatorButtons(double buttonWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '1',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () => addNumber('1'),
        ),
        CalculatorButton(
          text: '2',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () => addNumber('2'),
        ),
        CalculatorButton(
          text: '3',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () => addNumber('3'),
        ),
        CalculatorButton(
          text: '+',
          backgroundColor: changeBackgroundColorOperator('+'),
          textColor: changeTextColorOperator('+'),
          width: buttonWidth,
          onPressed: () {
            addOperand((p0, p1) => p0 + p1);
            setState(() => highlightOperator = '+');
          },
        ),
      ],
    );
  }

  Widget fivethRowCalculatorButtons(double buttonWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          width: 182,
          text: '0',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          onPressed: () => addNumber('0'),
        ),
        CalculatorButton(
          text: ',',
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () => addNumber(','),
        ),
        CalculatorButton(
          text: '=',
          backgroundColor: const Color.fromRGBO(255, 149, 0, 1),
          textColor: Colors.white,
          width: buttonWidth,
          onPressed: () {
            compute();
          },
        ),
      ],
    );
  }
}
