import 'package:flutter_app/model/post.dart';
import 'package:flutter_app/services/posts_api.dart';
import 'package:flutter_app/views_model/base_model.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeModel extends BaseModel {
  PostApiService postApiService;
  List<Post> postNews = [];

  HomeModel() {
    postApiService = PostApiService.getInstancePost();
    getPosts();
  }

  Future<void> getPosts() async {
    setLoading(true);
    try {
      postNews = await postApiService.getPost();
      notifyListeners();
    } catch(err) {
      showToast("Lỗi, không thể vào trang chủ!");
    } finally {
      setLoading(false);
    }
  }

  Future<void> logout() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.remove("token");
  }
}
