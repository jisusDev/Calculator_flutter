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
  //controladores de los textfield
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();

  //variables para ejecutar la operacion matematica
  double? valueX1;
  double? valueY1;
  double? valueX2;
  double? valueY2Result;


  //convierte los valores de los controller en numeros
  @override
  void initState() {
    super.initState();
    valueX1 = double.tryParse(textEditingController2.text);
    valueY1 = double.tryParse(textEditingController3.text);
    valueX2 = double.tryParse(textEditingController1.text);
    currentTextField = textEditingController1;
    crossMultiplicationFuntion();
  }

  // funcion que calcula la regla de tres donde multiplica y luego divide
  void crossMultiplicationFuntion() {
    if (valueX1 != null && valueY1 != null && valueX2 != null && valueY1 != 0) {
      valueY2Result = (valueX1! * valueY1!) / valueX2!;
    } else {
      valueY2Result = null;
    }
    //intento de agregar el resultado a un textfield
    if (valueY2Result != null) {
      textEditingController4.text = valueY2Result.toString();
    } else {
      textEditingController4.text = '';
    }
  }

  TextEditingController? currentTextField;

  void updateTextField(String value) {
    setState(() {
      currentTextField!.text = value;
    });
  }

  //agrega numero por numero al string del textfield seleccionado
  void addNumbers(String input) {
    String currentValue = currentTextField!.text;
    updateTextField(currentValue + input);
  }

  //eliminar numeros introducidos al textfield
  void deleteLastNumber() {
    if (currentTextField != null) {
      String currentValue = currentTextField!.text;
      if (currentValue.isNotEmpty) {
        String newValue = currentValue.substring(0, currentValue.length - 1);
        updateTextField(newValue);
      }
    }
  }

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
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextfieldCalculator(
                labelText: 'Valor X1',
                controller: textEditingController1,
                onTap: () {
                  setState(() {
                    currentTextField = textEditingController1;
                  });
                },
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: TextfieldCalculator(
                labelText: 'Valor Y1',
                controller: textEditingController2,
                onTap: () {
                  setState(() {
                    currentTextField = textEditingController2;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),
        Row(
          children: [
            Expanded(
              child: TextfieldCalculator(
                labelText: 'Valor X2',
                controller: textEditingController3,
                onTap: () {
                  setState(() {
                    currentTextField = textEditingController3;
                  });
                },
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: TextfieldCalculator(
                readOnly: true,
                labelText: 'Valor Y2',
                controller: textEditingController4,
              ),
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
          onPressed: () => addNumbers('1'),
        ),
        CalculatorButton(
          text: '2',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () => addNumbers('2'),
        ),
        CalculatorButton(
          text: '3',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () => addNumbers('3'),
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
          onPressed: () => addNumbers('4'),
        ),
        CalculatorButton(
          text: '5',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () => addNumbers('5'),
        ),
        CalculatorButton(
          text: '6',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () => addNumbers('6'),
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
          onPressed: () => addNumbers('7'),
        ),
        CalculatorButton(
          text: '8',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () => addNumbers('8'),
        ),
        CalculatorButton(
          text: '9',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () => addNumbers('9'),
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
          onPressed: () => addNumbers(','),
        ),
        CalculatorButton(
          text: '0',
          backgroundColor: colorGrayButton,
          textColor: Colors.white,
          onPressed: () => addNumbers('0'),
        ),
        CalculatorButton(
          text: '=',
          backgroundColor: colorOrangeButton,
          textColor: Colors.white,
          onPressed: () {
            deleteLastNumber();
          },
        ),
      ],
    );
  }
}
