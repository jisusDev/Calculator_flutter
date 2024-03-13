import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  final double width;
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
    this.width = 72,
  });

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(widget.width, 72),
          ),
          overlayColor: MaterialStateProperty.all(
            Colors.white.withOpacity(0.3),
          ),
          backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 36.0,
            color: widget.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
