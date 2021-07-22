import 'package:flutter/material.dart';
import 'package:flutter_app/routers/router_name.dart';
import 'package:flutter_app/services/login_api.dart';
import 'package:flutter_app/views_model/base_model.dart';
import 'package:oktoast/oktoast.dart';

class LoginModel extends BaseModel {
  LoginApiService loginApiService;
  BuildContext context;
  LoginModel(BuildContext context) {
    this.context = context;
    loginApiService = LoginApiService.getInstance();
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
    try {
      bool isSuccess = await loginApiService.login(userId, password);
      if (isSuccess == true) {
        Navigator.pushReplacementNamed(context, RouterName.home);
      } else {
        // final snackBar = SnackBar(content: Text('Đăng nhập thất bại !'));
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        showToast("Dang nhap that bai!");
      }
      notifyListeners();
    } catch(err) {
      showToast("Dang nhap that bai!");
    } finally {
      setLoading(false);
    }
  }
}
