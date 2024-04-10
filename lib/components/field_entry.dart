import 'package:flutter/material.dart';

class FieldEntry extends StatelessWidget {
  final String nameField;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final TextInputType inputType;

  const FieldEntry(this.nameField,
      {super.key,
      required this.controller,
      this.validate,
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${nameField.toUpperCase()}:',
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextFormField(
              controller: controller,
              validator: validate,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Digite o $nameField',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
        ],
      ),
    );
  }
}
