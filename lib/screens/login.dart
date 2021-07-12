import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Widget/text_field_login.dart';
import 'package:flutter_app/view_model/login_model.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget build(BuildContext context) {
    var _userNameErr = "Email k duoc trong";
    var _passErr = "Mat khau k duoc trong";
    bool _userInvalid = true;
    bool _passInvalid = true;

    return Scaffold(
      body: ChangeNotifierProvider<LoginModel>(
        create: (context) => LoginModel(context),
        child: Consumer<LoginModel>(
          builder: (context, model, _) => Container(
            color: Colors.white,
            child: Center(
              child: model.loading
                  ? CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(fontSize: 40),
                          ),
                          SizedBox(
                            height: 45.0,
                          ),
                          TextFieldLogin(
                            hintText: "Email hoặc số điện thoại",
                            errorText: _userInvalid ? _userNameErr : null,
                            onChanged: (value) {
                              model.onUserIdChanged(value);
                            },
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          TextFieldLogin(
                            hintText: "Mật khẩu",
                            errorText: _passInvalid ? _passErr : null,
                            onChanged: (value) {
                              model.onPasswordChanged(value);
                            },
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    if (model.userId.isEmpty) {
                                      _userInvalid = true;
                                    } else {
                                      _userInvalid = false;
                                      await model.onLogin();
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
        ),
      ),
    );
  }
}
