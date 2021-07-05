import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/end_point.dart';
import 'package:flutter_app/model/login_responses.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/view_model/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel extends BaseModel {
  BuildContext context;
  LoginModel(BuildContext context) {
    this.context = context;
  }
  String userId = "";
  onUserIdChanged(String newUserId) {
    userId = newUserId;
  }

  String password = "";
  onPasswordChanged(String newPassword) {
    password = newPassword;
  }

  Future<void> onLogin() async {
    setLoading(true);
    var params = {"account": "TEACHER"};
    var header = {"Content-Type": "application/json"};
    var response = await Dio().post("${EndPoint.baseUrl}${EndPoint.getLogin}",
        queryParameters: params,
        data: {"userId": userId, "password": password},
        options: Options(headers: header));
    if (response.statusCode == 200) {
      String token = LoginRespon.fromJson(response.data).accessToken;
      String tokenType = LoginRespon.fromJson(response.data).tokenType;
      SharedPreferences pre = await SharedPreferences.getInstance();
      await pre.setString("token", token);
      await pre.setString("tokenType", tokenType);
      if (token != null && token.isNotEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } else if (response.statusCode == 400) {
      final snackBar = SnackBar(content: Text('Dang Nhap that bai !'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    print(response);
    notifyListeners();
    setLoading(false);
  }
}
