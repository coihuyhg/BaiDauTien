import 'package:flutter/material.dart';

class redButton extends StatelessWidget {
  redButton({@required this.onPressed,@required this.child});

  Function onPressed;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: onPressed, child: child, color: Colors.red,);
  }
}
