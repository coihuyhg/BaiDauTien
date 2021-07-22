import 'package:dio/dio.dart';
import 'package:flutter_app/constant/end_point.dart';
import 'package:flutter_app/model/login_responses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiService {
  static LoginApiService _instance;
  static LoginApiService getInstance() {
    if (_instance == null) {
      _instance = LoginApiService();
    }
    return _instance;
  }
  Future<bool> login(String userId, String password) async {
    bool isSuccess;
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
      isSuccess = true;
    } else if (response.statusCode == 400) {
      isSuccess = false;
    }
    return isSuccess;
  }
}