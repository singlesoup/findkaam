// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.type,
    this.email,
    this.name,
    this.mno,
    this.ps,
  });

  String? type;
  String? email;
  String? name;
  String? mno;
  String? ps;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        type: json["type"],
        email: json["email"],
        name: json["name"],
        mno: json["mno"],
        ps: json["ps"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "email": email,
        "name": name,
        "mno": mno,
        "ps": ps,
      };
}
