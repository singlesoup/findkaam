// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.type,
    this.email,
    this.ps,
  });

  String? type;
  String? email;

  String? ps;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        type: json["type"],
        email: json["email"],
        ps: json["ps"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "email": email,
        "ps": ps,
      };
}
