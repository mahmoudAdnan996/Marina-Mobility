
class LoginRequest{
  LoginRequest({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}