import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:flutter_app/view_model/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashModel extends BaseModel{
  BuildContext context;
  SplashModel(this.context) {
    init();
  }
  init() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    String token = pre.getString("token");
    if (token == null){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Login()));
    } else {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => HomePage()));
    }
  }
}