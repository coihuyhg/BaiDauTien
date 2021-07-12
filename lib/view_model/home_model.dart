import 'package:dio/dio.dart';
import 'package:flutter_app/constant/end_point.dart';
import 'package:flutter_app/model/post.dart';
import 'package:flutter_app/view_model/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeModel extends BaseModel {
  List<Post> posts = [];

  HomeModel() {
    getPosts();
  }

  Future<void> getPosts() async {
    setLoading(true);
    SharedPreferences pre = await SharedPreferences.getInstance();
    String token = pre.getString("token");
    String tokenType = pre.getString("tokenType");
    var header = {"Authorization": "$tokenType $token"};
    var body = {"number": 10};
    var response = await Dio().get("${EndPoint.baseUrl}${EndPoint.getPosts}",
        options: Options(headers: header), queryParameters: body);
    print(response);
    List<Post> newPosts =
        (response.data as List).map((item) => Post.fromJson(item)).toList();
    posts = newPosts;
    notifyListeners();
    setLoading(false);
  }

  Future<void> logout() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.remove("token");
  }
}
