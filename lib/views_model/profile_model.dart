import 'package:flutter_app/model/profile_responses.dart';
import 'package:flutter_app/services/profile_api.dart';
import 'package:flutter_app/views_model/base_model.dart';
import 'package:oktoast/oktoast.dart';

class ProfileModel extends BaseModel {
  ProfileApiService profileApiService;
  ProfileRespon profile;
  ProfileModel() {
    profileApiService = ProfileApiService.getinstanceProfile();
    onProfile();
  }
  Future<void> onProfile() async {
    setLoading(true);
    try {
      profile = await profileApiService.onProfile();
      notifyListeners();
    } catch(err) {
      showToast("Lỗi, không xem được trang cá nhân!");
    } finally {
      setLoading(false);
    }
  }
}
