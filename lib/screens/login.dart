import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/views_model/login_model.dart';
import 'package:flutter_app/widget/logo.dart';
import 'package:flutter_app/widget/text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => LoginModel(context),
      child: Consumer<LoginModel>(
        builder: (context, model, _) => Container(
          color: Colors.white,
          child: Center(
            child: model.loading
                ? CircularProgressIndicator()
                : Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Scaffold(
                        body: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //Logo(),
                                    Image.asset("assets/logo_icon"),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 10, 30, 10),
                                              child: TextFormFieldLogin(
                                                  labelText: "Tài khoản",
                                                  prefixIcon:
                                                      Icon(Icons.person),
                                                  onChanged: (value) {
                                                    model
                                                        .onUserIdChanged(value);
                                                  },
                                                  validator:
                                                      Validatorless.multiple([
                                                    Validatorless.number(
                                                        "Tài khoản không hợp lệ !"),
                                                    Validatorless.required(
                                                        "Tài khoản không hợp lệ !")
                                                  ]))),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 10, 30, 10),
                                              child: TextFormFieldLogin(
                                                labelText: "Mật khẩu",
                                                prefixIcon: Icon(Icons.lock),
                                                onChanged: (value) {
                                                  model
                                                      .onPasswordChanged(value);
                                                },
                                                validator:
                                                    Validatorless.multiple([
                                                  Validatorless.min(6,
                                                      "Mật khẩu không hợp lệ !"),
                                                  Validatorless.required(
                                                      "Mật khẩu không được trống !")
                                                ]),
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 30),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text("Quên mật khẩu ?"),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: TextButton(
                                              onPressed: () async {
                                                bool isValid = _formKey
                                                    .currentState
                                                    .validate();
                                                if (isValid == true) {
                                                  await model.onLogin();
                                                }
                                              },
                                              child: Text("Đăng nhập")),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height / 10,
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
