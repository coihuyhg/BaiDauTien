import 'package:flutter/material.dart';
import 'package:flutter_app/routers/router_name.dart';
import 'package:flutter_app/screens/comment.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:flutter_app/screens/profile.dart';
import 'package:flutter_app/screens/splash.dart';

class MainRouter {
  static Route generate(RouteSettings settings){
    switch (settings.name) {
      case RouterName.splash:
        return MaterialPageRoute<dynamic>(builder: (_) => Splash());
      case RouterName.login:
        return MaterialPageRoute<dynamic>(builder: (_) => Login());
      case RouterName.home:
        return MaterialPageRoute<dynamic>(builder: (_) => HomePage());
      case RouterName.comment:
        return MaterialPageRoute<dynamic>(builder: (_) => Comment(settings.arguments));
      case RouterName.profile:
        return MaterialPageRoute<dynamic>(builder: (_) => Profile());
      default:
        return MaterialPageRoute<dynamic>(builder: (_) => Scaffold(body: Text("Trang không tồn tại"),));
    }
  }
}