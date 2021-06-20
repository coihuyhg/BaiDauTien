import 'package:flutter/material.dart';

class text_field_Login extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  String errorText;

  text_field_Login({
    @required this.textEditingController,
    @required this.hintText,
    @required this.errorText
});
  Widget build (BuildContext context) {
    return TextField(
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