import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DangNhap.dart';
import 'package:flutter_app/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget build(BuildContext context) {
    TextEditingController _userController = new TextEditingController();
    TextEditingController _passController = new TextEditingController();
    TextEditingController _rspassController = new TextEditingController();
    var _userNameErr = "Email k duoc trong";
    var _passErr = "Mat khau k duoc trong";
    var _rspassErr = "Mat khau k duoc trong";
    bool _userInvalid = true;
    bool _passInvalid = true;
    bool _rspassInvalid = true;
    var url = Uri.parse('https://reqres.in/api/register');

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
                Text("Sign Up", style: TextStyle(fontSize: 40, color: Colors.black),),
                SizedBox(height: 45.0,),
                TextField(
                  controller: _userController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Email hoac so dien thoai",
                      errorText: _userInvalid ? _userNameErr : null,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
                ),
                SizedBox(height: 25.0,),
                TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Nhập mật khẩu",
                      errorText: _passInvalid ? _passErr : null,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
                ),
                SizedBox(height: 25.0,),
                TextField(
                  controller: _rspassController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Nhập lại mật khẩu",
                    errorText: _rspassInvalid ? _rspassErr : null,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
                ),
                SizedBox(height: 35.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () async {
                          if (_userController.text.isEmpty) {
                            setState(() {
                              _userInvalid = true;
                            });
                          } else {
                            setState(() {
                              _userInvalid = false;
                            });
                            var respon = await http.post(url, body: {
                              "email": _userController.text,
                              "password": _passController.text
                            });
                            if (respon.statusCode == 200) {
                              String token = registerResponseFromJson(respon.body)
                                  .token;
                              if (token != null && token.isNotEmpty) {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Login()));
                              }
                            }
                            else if (respon.statusCode == 400) {
                              final snackBar = SnackBar(
                                  content: Text('Dang Nhap that bai !'));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar);
                            }
                          }
                        },
                        child: Text("Sign Up")),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}