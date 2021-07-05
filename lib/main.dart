import 'package:flutter/material.dart';
import 'package:flutter_app/screens/splash.dart';

//Da sua lai
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bài viết nổi bật",
      home: Splash()
    );
  }
}