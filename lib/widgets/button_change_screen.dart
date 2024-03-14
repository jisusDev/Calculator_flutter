import 'package:flutter/material.dart';

class ButtonChangeScreen extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;
  const ButtonChangeScreen({
    super.key,
    required this.icon,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        splashColor: Colors.white12,
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                icon,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}