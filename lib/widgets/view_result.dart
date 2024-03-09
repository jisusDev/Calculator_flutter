import 'package:flutter/material.dart';

class ViewResult extends StatelessWidget {
  final String value;
  const ViewResult({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 120,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
