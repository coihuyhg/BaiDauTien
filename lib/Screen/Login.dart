import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Model/LoginRespon.dart';
import 'package:flutter_app/Screen/Home.dart';
import 'package:flutter_app/Widget/redButton.dart';
import 'package:flutter_app/Widget/text_field_Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget build(BuildContext context) {
    TextEditingController _userController = new TextEditingController();
    TextEditingController _passController = new TextEditingController();
    var _userNameErr = "Email k duoc trong";
    var _passErr = "Mat khau k duoc trong";
    bool _userInvalid = true;
    bool _passInvalid = true;
    bool loading = true;

    return Scaffold(
      body: Center(
        child: Container(
          width: 500.0,
          height: 650.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 45.0,
                ),
                text_field_Login(
                    textEditingController: _userController,
                    hintText: "Email hoặc số điện thoại",
                    errorText: _userInvalid ? _userNameErr : null),
                SizedBox(
                  height: 25.0,
                ),
                text_field_Login(
                    textEditingController: _passController,
                    hintText: "Mật khẩu",
                    errorText: _passInvalid ? _passErr : null),
                SizedBox(
                  height: 35.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () async {
                          if (_userController.text.isEmpty) {
                            setState(() {
                              _userInvalid = true;
                              loading = false;
                            });
                          } else {
                            setState(() {
                              _userInvalid = false;
                            });
                            var params = {"account": "TEACHER"};
                            var header = {"Content-Type": "application/json"};
                            var response = await Dio().post(
                                "http://pcdashboard.herokuapp.com/auth/signin",
                                queryParameters: params,
                                data: {
                                  "userId": _userController.text,
                                  "password": _passController.text
                                },
                                options: Options(headers: header));
                            print(response);
                            if (response.statusCode == 200) {
                              String token = LoginRespon.fromJson(response.data)
                                  .accessToken;
                              String tokenType =
                                  LoginRespon.fromJson(response.data).tokenType;
                              SharedPreferences pre =
                                  await SharedPreferences.getInstance();
                              await pre.setString("token", token);
                              await pre.setString("tokenType", tokenType);
                              if (token != null && token.isNotEmpty) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            } else if (response.statusCode == 400) {
                              final snackBar = SnackBar(
                                  content: Text('Dang Nhap that bai !'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text("Login")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
