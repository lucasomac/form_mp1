import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const ButtonForm({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label.toUpperCase(),
      ),
    );
  }
}
