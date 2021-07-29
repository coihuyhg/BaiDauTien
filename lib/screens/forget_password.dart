import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/router_name.dart';
import 'package:flutter_app/widget/text_button_login.dart';
import 'package:flutter_app/widget/text_form_field.dart';

class ForgetPassword extends StatefulWidget {
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset("assets/logo_icon.png"),
                    //Logo(),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: TextFormFieldLogin(
                            labelText: "Tài khoản",
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(RouterName.login);
                                },
                                child: Text("Trở về"),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: TextButtonLogin(
                            onPressed: () {},
                            title: "Lấy mật khẩu",
                          )
                        ),
                        SizedBox(
                          height: MediaQuery.of(context)
                              .size
                              .height /
                              10,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
