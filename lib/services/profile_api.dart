import 'package:dio/dio.dart';
import 'package:flutter_app/constant/end_point.dart';
import 'package:flutter_app/model/profile_responses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApiService {
  static ProfileApiService _instanceProfile;
  static ProfileApiService getinstanceProfile() {
    if (_instanceProfile == null) {
      _instanceProfile = ProfileApiService();
    }
    return _instanceProfile;
  }

  Future<ProfileRespon> onProfile() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String token = pre.getString("token");
    String tokenType = pre.getString("tokenType");
    var headers = {
      "Authorization": "$tokenType $token",
      "Content-Type": "application/json",
    };
    var response = await Dio().get("${EndPoint.baseUrl}${EndPoint.getProfile}",
        options: Options(headers: headers));
    ProfileRespon newProfile = ProfileRespon.fromJson(response.data);
    return newProfile;
  }
}
