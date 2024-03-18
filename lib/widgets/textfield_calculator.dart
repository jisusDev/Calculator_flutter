import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldCalculator extends StatefulWidget {
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final String? labelText;
  final bool readOnly;
  const TextfieldCalculator({
    super.key,
    required this.labelText,
    required this.controller,
    this.onTap,
    this.readOnly = false,
    this.onChanged,
  });

  @override
  State<TextfieldCalculator> createState() => _TextfieldCalculatorState();
}

class _TextfieldCalculatorState extends State<TextfieldCalculator> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [LengthLimitingTextInputFormatter(9)],
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      controller: widget.controller,
      readOnly: widget.readOnly,
      maxLines: 1,
      keyboardType: TextInputType.none,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: widget.labelText,
        floatingLabelStyle:
            const TextStyle(color: Colors.white, letterSpacing: 2),
        labelStyle: const TextStyle(color: Colors.white30, letterSpacing: 1),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 149, 0, 1),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
      ),
    );
  }
}
