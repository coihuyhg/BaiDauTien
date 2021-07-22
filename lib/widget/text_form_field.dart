import 'package:flutter/material.dart';

class TextFormFieldLogin extends StatelessWidget {
  Function(String) onChanged;
  String labelText;
  Function(String) validator;

  TextFormFieldLogin({
    @required this.onChanged,
    @required this.labelText,
    @required this.validator,
  });

  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText
      ),
      validator: validator
    );
  }
}
