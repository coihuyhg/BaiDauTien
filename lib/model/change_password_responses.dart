import 'dart:convert';

ChangePasswordResponses changePasswordResponsesFromJson(String str) => ChangePasswordResponses.fromJson(json.decode(str));

String changePasswordResponsesToJson(ChangePasswordResponses data) => json.encode(data.toJson());

class ChangePasswordResponses {
  ChangePasswordResponses({
    this.userId,
    this.oldPassword,
    this.newPassword,
  });

  String userId;
  String oldPassword;
  String newPassword;

  factory ChangePasswordResponses.fromJson(Map<String, dynamic> json) => ChangePasswordResponses(
    userId: json["userId"],
    oldPassword: json["oldPassword"],
    newPassword: json["newPassword"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "oldPassword": oldPassword,
    "newPassword": newPassword,
  };
}