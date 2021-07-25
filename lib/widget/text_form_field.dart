import 'package:flutter/material.dart';

class TextFormFieldLogin extends StatelessWidget {
  String labelText;
  Icon prefixIcon;
  Function(String) onChanged;
  Function(String) validator;

  TextFormFieldLogin({
    @required this.labelText,
    @required this.prefixIcon,
    @required this.onChanged,
    @required this.validator,
  });

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(5, 5)
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.black
        ),
        child: TextFormField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(30)),
                  borderSide: BorderSide.none),
              labelText: labelText,
              labelStyle: TextStyle(fontSize: 18),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: prefixIcon,
              )),
          onChanged: onChanged,
          validator: validator,
        ),
      ),
    );
  }
}
