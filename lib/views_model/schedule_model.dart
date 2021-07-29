import 'package:flutter_app/model/schedule_responses.dart';
import 'package:flutter_app/services/schedule_api.dart';
import 'package:flutter_app/views_model/base_model.dart';
import 'package:oktoast/oktoast.dart';

class ScheduleModel extends BaseModel {
  String classId;
  ScheduleApiService scheduleApiService ;
  List<ScheduleRespon> postSchedule = [];

  ScheduleModel(this.classId) {
    scheduleApiService = ScheduleApiService.getInstanceSchedule();
    getSchedule();
  }

  Future<void> getSchedule() async {
    setLoading(true);
    try {
      postSchedule = await scheduleApiService.getSchedule(classId);
      notifyListeners();
    } catch(err) {
      showToast("Lỗi, không thể xem lịch làm việc", );
      print(err);
    } finally {
      setLoading(false);
    }
  }
}
