import 'dart:convert';

List<CommentRespon> commentResponFromJson(String str) => List<CommentRespon>.from(json.decode(str).map((x) => CommentRespon.fromJson(x)));

String commentResponToJson(List<CommentRespon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentRespon {
  CommentRespon({
    this.id,
    this.content,
    this.time,
    this.userId,
    this.userAvatar,
    this.userName,
  });

  String id;
  String content;
  String time;
  String userId;
  String userAvatar;
  String userName;

  factory CommentRespon.fromJson(Map<String, dynamic> json) => CommentRespon(
    id: json["id"],
    content: json["content"],
    time: json["time"],
    userId: json["userId"],
    userAvatar: json["userAvatar"],
    userName: json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "time": time,
    "userId": userId,
    "userAvatar": userAvatar,
    "userName": userName,
  };
}