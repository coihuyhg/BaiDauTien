import 'dart:convert';

LoginRespon loginResponFromJson(String str) => LoginRespon.fromJson(json.decode(str));

String loginResponToJson(LoginRespon data) => json.encode(data.toJson());

class LoginRespon {
  LoginRespon({
    this.tokenType,
    this.accessToken,
  });

  String tokenType;
  String accessToken;

  factory LoginRespon.fromJson(Map<String, dynamic> json) => LoginRespon(
    tokenType: json["tokenType"],
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "tokenType": tokenType,
    "accessToken": accessToken,
  };
}