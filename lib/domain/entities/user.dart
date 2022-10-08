import 'package:json_annotation/json_annotation.dart';

class User {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "accessToken")
  final String accessToken;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.accessToken});
}