import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  String errorText;
  Function(String) onChanged;

  TextFieldLogin({
    @required this.textEditingController,
    @required this.hintText,
    @required this.errorText,
    @required this.onChanged,
});
  Widget build (BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: hintText,
        errorText: errorText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32)
        )
      ),
    );
  }
}