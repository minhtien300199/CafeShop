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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      userName: json["userName"],
      password: json["password"],
      authenticate: json["authenticate"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}
