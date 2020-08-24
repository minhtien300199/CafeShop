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
  String userId;

  User({
    this.userId,
  });
  Map<String, dynamic> get map {
    return {
      "uid": userId,
    };
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': userId.trim(),
    };
    return map;
  }
}
