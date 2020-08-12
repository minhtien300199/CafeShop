class UserResponseModel {
  final String authenticate;
  final String error;
  final String userName;

  UserResponseModel({this.authenticate, this.error, this.userName});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
        authenticate: json["authenticate"] != null ? json["authenticate"] : "",
        error: json["error"] != null ? json["error"] : "",
        userName: json["userName"] != null ? json["userName"] : "");
  }
}

class User {
  String id;
  String userName;
  String password;
  String authenticate;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
      this.userName,
      this.password,
      this.authenticate,
      this.createdAt,
      this.updatedAt});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userName': userName.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
