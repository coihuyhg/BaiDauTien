import 'package:flutter/material.dart';
import 'package:flutter_app/view_model/splash_model.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider<SplashModel>(
          create: (context) => SplashModel(context),
            child: Consumer<SplashModel>(
              builder: (context, value, child) => FlutterLogo())),
      ),
    );
  }
}
