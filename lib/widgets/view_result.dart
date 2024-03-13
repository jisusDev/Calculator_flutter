import 'package:flutter/material.dart';

class ViewResult extends StatelessWidget {
  final String value;
  const ViewResult({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FittedBox(
          child: Text(
        value,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 100,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
        )
      ],
    );
  }
}
