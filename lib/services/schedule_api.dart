import 'package:dio/dio.dart';
import 'package:flutter_app/constant/end_point.dart';
import 'package:flutter_app/model/schedule_responses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleApiService {
  static ScheduleApiService _instanceSchedule;
  static ScheduleApiService getInstanceSchedule() {
    if (_instanceSchedule == null) {
      _instanceSchedule = ScheduleApiService();
    }
    return _instanceSchedule;
  }

  Future<List<ScheduleRespon>> getSchedule(String classId) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String token = pre.getString("token");
    String tokenType = pre.getString("tokenType");
    var header = {"Authorization": "$tokenType $token"};
    var response = await Dio().get(
        "${EndPoint.baseUrl}${EndPoint.getSchedule}$classId",
        options: Options(headers: header));
    List<ScheduleRespon> newSchedule = (response.data as List)
        .map((item) => ScheduleRespon.fromJson(item))
        .toList();
    return newSchedule;
  }
}
