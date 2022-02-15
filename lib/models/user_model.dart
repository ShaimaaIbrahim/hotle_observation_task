import 'package:convert/convert.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';
class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  int? has_book;

  UserModel({this.id, this.name, this.email, this.password, this.has_book});

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      has_book: json['has_book'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'password': password,
    'has_book': has_book,
  };
}
