import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthModel {
  final String accessToken;
  final String refleshToken;
  AuthModel({
    required this.accessToken,
    required this.refleshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'reflesh_token': refleshToken,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      accessToken: map['access_token'] ?? "",
      refleshToken: map['reflesh_token'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
