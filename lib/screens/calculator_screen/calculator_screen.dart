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
            child: ViewResult(value: '0')
          ),
          Column(
            children: [
              rowFourButtonsCalculator(),
              rowFourButtonsCalculator(),
              rowFourButtonsCalculator(),
              rowThreeButtonsCalculator(),
            ],
          ),
        ],
      ),
    );
  }

  Widget rowFourButtonsCalculator() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Btn(),
        Btn(),
        Btn(),
        Btn(),
      ],
    );
  }

  Widget rowThreeButtonsCalculator() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Btn(width: 156),
        Btn(),
        Btn(),
      ],
    );
  }
}


//TODO: Elinimar este codigo hacia abajo, y reemplazar el el boton
class Btn extends StatelessWidget {
  final double width;
  const Btn({
    super.key,
    this.width = 72,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: width,
        height: 72,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(36)),
      ),
    );
  }
}
