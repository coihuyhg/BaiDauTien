import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/views_model/login_model.dart';
import 'package:flutter_app/widget/text_form_field.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icon.png", width: 100.0, height: 100.0,),
                            SizedBox(
                              height: 45.0,
                            ),
                            TextFormFieldLogin(
                                onChanged: (value) {
                                  model.onUserIdChanged(value);
                                },
                                labelText: "UserId",
                                validator: Validatorless.multiple([
                                  Validatorless.number("Id không hợp lệ !"),
                                  Validatorless.required(
                                      "UserId không hợp lệ !")
                                ])),
                            SizedBox(
                              height: 25.0,
                            ),
                            TextFormFieldLogin(
                              onChanged: (value) {
                                model.onPasswordChanged(value);
                              },
                              labelText: "PassWord",
                              validator: Validatorless.multiple([
                                Validatorless.min(6, "Pass phải có 6 ký tự !"),
                                Validatorless.required(
                                    "Password không được trống !")
                              ]),
                            ),
                            SizedBox(
                              height: 35.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () async {
                                      bool isValid =
                                          _formKey.currentState.validate();
                                      if (isValid == true) {
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
      ),
    );
  }
}
