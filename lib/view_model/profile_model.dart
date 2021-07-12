import 'package:dio/dio.dart';
import 'package:flutter_app/constant/end_point.dart';
import 'package:flutter_app/model/profile_responses.dart';
import 'package:flutter_app/view_model/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileModel extends BaseModel {
  ProfileRespon profile;
  ProfileModel() {
    onProfile();
  }
  Future<void> onProfile() async {
    setLoading(true);
    SharedPreferences pre = await SharedPreferences.getInstance();
    String token = pre.getString("token");
    String tokenType = pre.getString("tokenType");
    var headers = {
      "Authorization": "$tokenType $token",
      "Content-Type": "application/json",
    };
    var response = await Dio().get("${EndPoint.baseUrl}${EndPoint.getProfile}",
        options: Options(headers: headers));
    print(response);
    ProfileRespon newProfile = ProfileRespon.fromJson(response.data);
    profile = newProfile;
    notifyListeners();
    setLoading(false);
  }
}
