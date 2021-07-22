import 'package:dio/dio.dart';
import 'package:flutter_app/constant/end_point.dart';
import 'package:flutter_app/model/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostApiService {
  static PostApiService _instance1;
  static PostApiService getinstance1() {
    if (_instance1 == null) {
      _instance1 = PostApiService();
    }
    return _instance1;
}
  Future<List<Post>> getPost() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String token = pre.getString("token");
    String tokenType = pre.getString("tokenType");
    var header = {"Authorization": "$tokenType $token"};
    var body = {"number": 10};
    var response = await Dio().get("${EndPoint.baseUrl}${EndPoint.getPosts}",
        options: Options(headers: header), queryParameters: body);
    List<Post> newPosts =
        (response.data as List).map((item) => Post.fromJson(item)).toList();
    return newPosts;
  }
}
