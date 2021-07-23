import 'package:dio/dio.dart';
import 'package:flutter_app/constant/end_point.dart';
import 'package:flutter_app/model/comment_responses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentApiService {
  static CommentApiService _instanceComment;
  static CommentApiService getInstanceComment() {
    if (_instanceComment == null) {
      _instanceComment = CommentApiService();
    }
    return _instanceComment;
  }

  Future<List<CommentRespon>> getComment(String postId) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String token = pre.getString("token");
    String tokenType = pre.getString("tokenType");
    var header = {"Authorization": "$tokenType $token"};
    var response = await Dio().get(
        "${EndPoint.baseUrl}${EndPoint.getComment}$postId",
        options: Options(headers: header));
    List<CommentRespon> newComment = (response.data as List)
        .map((item) => CommentRespon.fromJson(item))
        .toList();
    return newComment;
  }
}
