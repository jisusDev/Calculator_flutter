import 'package:flutter/cupertino.dart';

class CalculatorButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
  });

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          pressedOpacity: 0.0,
          onPressed: widget.onPressed,
          color: widget.backgroundColor,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 38.0,
              color: widget.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
