import 'dart:convert';

ProfileRespon profileResponFromJson(String str) => ProfileRespon.fromJson(json.decode(str));

String profileResponToJson(ProfileRespon data) => json.encode(data.toJson());

class ProfileRespon {
  ProfileRespon({
    this.name,
    this.userId,
    this.email,
    this.phone,
    this.classId,
    this.avatar,
    this.role,
  });

  String name;
  String userId;
  String email;
  String phone;
  String classId;
  String avatar;
  String role;

  factory ProfileRespon.fromJson(Map<String, dynamic> json) => ProfileRespon(
    name: json["name"],
    userId: json["userId"],
    email: json["email"],
    phone: json["phone"],
    classId: json["classId"],
    avatar: json["avatar"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "userId": userId,
    "email": email,
    "phone": phone,
    "classId": classId,
    "avatar": avatar,
    "role": role,
  };
}
