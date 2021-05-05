import 'package:flutter/material.dart';

class comment extends StatefulWidget {
  @override
  _commentState createState() => _commentState();
}

class _commentState extends State<comment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.blue,
              child: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){ Navigator.pop(context);
              },),
            )
          ],
        )
    );
  }
}