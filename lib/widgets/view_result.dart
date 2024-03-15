import 'package:flutter/material.dart';

class ViewResult extends StatefulWidget {
  final String value;
  const ViewResult({
    super.key,
    required this.value,
  });

  @override
  State<ViewResult> createState() => _ViewResultState();
}

class _ViewResultState extends State<ViewResult> {
  String _getDisplayValue() {
    if (widget.value.length <= 9) {
      return widget.value;
    } else {
      return widget.value.substring(0, 9);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FittedBox(
          child: Text(
            _getDisplayValue(),
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
