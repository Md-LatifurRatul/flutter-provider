import 'package:flutter/material.dart';

class TextInputForm extends StatelessWidget {
  const TextInputForm(
      {super.key, required this.labelText, required this.onSaved});

  final String labelText;
  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      initialValue: '',
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return '$labelText is required';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
