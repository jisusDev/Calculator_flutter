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
  final String valueX1 = '';
  final String valueX2 = '';
  final String valueY1 = '';
  final String valueY2 = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: groupTextfield(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [
                firstRowCrossMultButtons(),
                secondRowCrossMultButtons(),
                thirdRowCrossMultButtons(),
                fourthRowCrossMultButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column groupTextfield() {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextfieldCalculator(labelText: 'Valor X1'),
            ),
            SizedBox(width: 32),
            Expanded(
              child: TextfieldCalculator(labelText: 'Valor Y1'),
            ),
          ],
        ),
        SizedBox(height: 48),
        Row(
          children: [
            Expanded(
              child: TextfieldCalculator(labelText: 'Valor X2'),
            ),
            SizedBox(width: 32),
            Expanded(
              child: TextfieldCalculator(labelText: 'Valor Y2'),
            ),
          ],
        ),
      ],
    );
  }

  final Color colorGrayButton = const Color.fromARGB(255, 51, 51, 51);
  final Color colorWhiteButton = const Color.fromRGBO(199, 199, 204, 1);
  final Color colorOrangeButton = const Color.fromRGBO(255, 149, 0, 1);

  Widget firstRowCrossMultButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '1',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '2',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '3',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget secondRowCrossMultButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '4',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '5',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '6',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget thirdRowCrossMultButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: '7',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '8',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '9',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget fourthRowCrossMultButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalculatorButton(
          text: ',',
          backgroundColor: colorWhiteButton,
          textColor: Colors.black,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '0',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
        CalculatorButton(
          text: '=',
          backgroundColor: colorOrangeButton,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
