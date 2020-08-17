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
  String fullName;
  String photoUrl;
  String email;
  String password;
  String authenticate;
  String createdAt;
  String updatedAt;
  String phoneNumber;
  User(
      {this.id,
      this.userName,
      this.password,
      this.authenticate,
      this.createdAt,
      this.updatedAt,
      this.fullName,
      this.email,
      this.photoUrl,
      this.phoneNumber});
  Map<String, dynamic> get map {
    return {
      "id": id,
      "password": password.trim(),
      "fullName": fullName,
      'email': email,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber
    };
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userName': userName.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
