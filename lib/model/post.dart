import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.id,
    this.content,
    this.image,
    this.time,
    this.userId,
    this.userAvatar,
    this.userName,
    this.userRole,
  });

  String id;
  String content;
  String image;
  String time;
  String userId;
  String userAvatar;
  String userName;
  String userRole;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        content: json["content"],
        image: json["image"] == null ? null : json["image"],
        time: json["time"],
        userId: json["userId"],
        userAvatar: json["userAvatar"],
        userName: json["userName"],
        userRole: json["userRole"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "image": image == null ? null : image,
        "time": time,
        "userId": userId,
        "userAvatar": userAvatar,
        "userName": userName,
        "userRole": userRole,
      };
}
