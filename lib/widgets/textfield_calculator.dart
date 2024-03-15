import 'package:flutter/material.dart';

class TextfieldCalculator extends StatefulWidget {
  final Function()? onEditingComplete;
  final String? labelText;
  const TextfieldCalculator({
    super.key,
    required this.labelText,
    this.onEditingComplete,
  });

  @override
  State<TextfieldCalculator> createState() => _TextfieldCalculatorState();
}

class _TextfieldCalculatorState extends State<TextfieldCalculator> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      controller: _controller,
      focusNode: _focusNode,
      onEditingComplete: widget.onEditingComplete,
      keyboardType: TextInputType.none,
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
