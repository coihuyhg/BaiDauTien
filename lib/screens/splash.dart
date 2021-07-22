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
      body: Center(
        child: ChangeNotifierProvider<SplashModel>(
          create: (context) => SplashModel(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<SplashModel>(
                builder: (context, value, child) => Image.asset("assets/icon.png", width: 100.0, height: 100.0,),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 10,
              ),
              SpinKitFadingCircle(
                color: Colors.black,
                size: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
