import 'package:flutter/material.dart';
import 'package:flutter_app/DangKy.dart';
import 'package:flutter_app/LoginRespon.dart';
import 'package:flutter_app/TrangChu.dart';
import 'package:http/http.dart' as http;

class Login extends  StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context){
    TextEditingController _userController = new TextEditingController();
    TextEditingController _passController = new TextEditingController();
    var _userNameErr = "Email k duoc trong";
    var _passErr = "";
    bool _userInvalid = false;
    var _passInvalid = false;
    var url = Uri.parse('https://reqres.in/api/login');

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
                Text("Login", style: TextStyle(fontSize: 40),),
                SizedBox(height: 45.0,),
                TextField(
                  controller: _userController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email hoặc số điệnt thoại",
                    errorText: _userInvalid ? _userNameErr : null,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
                ),
                SizedBox(height: 25.0,),
                TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Mật khẩu",
                    errorText: _passInvalid ? _passErr : null,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
                ),
                SizedBox(height: 35.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        textColor: Colors.blue,
                        onPressed: () async {
                          if (_userController.text.isEmpty ) {
                            setState(() {
                              _userInvalid = true;
                            });
                          }
                          else {
                            setState(() {
                              _userInvalid = false;
                            });
                            var respon = await http.post(url, body: {
                              "email": _userController.text,
                              "password": _passController.text
                            });
                            if (respon.statusCode == 200) {
                              String token = loginResponFromJson(respon.body)
                                  .token;
                              if (token != null && token.isNotEmpty) {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => HomePage()));
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
                        child: Text("Login")),
                    SizedBox(width: 10.0),
                    FlatButton(
                        textColor: Colors.blue,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text("Sign Up")),
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