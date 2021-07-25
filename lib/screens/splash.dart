import 'package:flutter/material.dart';
import 'package:flutter_app/views_model/splash_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: ChangeNotifierProvider<SplashModel>(
            create: (context) => SplashModel(context),
            child: Consumer<SplashModel>(
              builder: (context, value, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Image.asset(
                    "assets/logo_icon.png",
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 10,
                  ),
                  SpinKitFadingCircle(
                    color: Colors.red[900],
                    size: 50.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
