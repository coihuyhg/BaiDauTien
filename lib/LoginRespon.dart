import 'dart:convert';

LoginRespon loginResponFromJson(String str) => LoginRespon.fromJson(json.decode(str));

String loginResponToJson(LoginRespon data) => json.encode(data.toJson());

class LoginRespon {
  LoginRespon({
    this.token,
  });

  String token;

  factory LoginRespon.fromJson(Map<String, dynamic> json) => LoginRespon(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}