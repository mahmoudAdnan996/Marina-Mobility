import 'package:marina_mobility/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';


@JsonSerializable()
class LoginResponse extends User{
  const LoginResponse({required super.id, required super.name, required super.email, required super.accessToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}