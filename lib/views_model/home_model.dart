import 'package:flutter_app/model/post.dart';
import 'package:flutter_app/services/posts_api.dart';
import 'package:flutter_app/views_model/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeModel extends BaseModel {
  PostApiService postApiService;
  List<Post> postNews = [];

  HomeModel() {
    postApiService = PostApiService.getinstance1();
    getPosts();
  }

  Future<void> getPosts() async {
    setLoading(true);
    postNews = await postApiService.getPost();
    notifyListeners();
    setLoading(false);
  }

  Future<void> logout() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.remove("token");
  }
}
