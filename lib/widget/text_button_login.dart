import 'package:flutter/material.dart';

class TextButtonLogin extends StatelessWidget {
  VoidCallback onPressed;
  String title;

  TextButtonLogin({
    @override this.onPressed,
    @override this.title,
  });
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(5, 5)),
        ],
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.red[900],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
