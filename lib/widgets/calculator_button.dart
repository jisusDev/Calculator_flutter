import 'package:flutter/cupertino.dart';
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: widget.width,
          height: 72,
          color: widget.backgroundColor,
          child: ElevatedButton(
            onPressed: widget.onPressed,
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
      ),
    );
  }
}
