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
    );
  }
}
