import 'package:flutter_app/model/comment_responses.dart';
import 'package:flutter_app/services/comments_api.dart';
import 'package:flutter_app/views_model/base_model.dart';
import 'package:oktoast/oktoast.dart';

class CommentModel extends BaseModel {
  String postId;
  CommentApiService commentApiService;
  List<CommentRespon> postComments = [];
  CommentModel(this.postId) {
    commentApiService = CommentApiService.getInstanceComment();
    getComment();
  }
  Future<void> getComment() async {
    setLoading(true);
    try {
      postComments = await commentApiService.getComment(postId);
      notifyListeners();
    } catch(err) {
      showToast("Lỗi, không thể bình luận");
    } finally {
      setLoading(false);
    }
  }

  Future<void> delete() async {}
}
