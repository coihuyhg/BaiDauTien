import 'package:dio/dio.dart';
import 'package:flutter_app/constant/end_point.dart';
import 'package:flutter_app/model/comment_responses.dart';
import 'package:flutter_app/view_model/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentModel extends BaseModel {
  String postId;
  List<CommentRespon> posts = [];
  CommentModel(this.postId) {
    getComment();
  }
  Future<void> getComment() async {
    setLoading(true);
    SharedPreferences pre = await SharedPreferences.getInstance();
    String token = pre.getString("token");
    String tokenType = pre.getString("tokenType");
    var header = {"Authorization": "$tokenType $token"};
    var response = await Dio().get(
        "${EndPoint.baseUrl}${EndPoint.getComment}$postId",
        options: Options(headers: header));
    print(response);
    List<CommentRespon> newComment = (response.data as List)
        .map((item) => CommentRespon.fromJson(item))
        .toList();
    posts = newComment;
    notifyListeners();
    setLoading(false);
  }
}
