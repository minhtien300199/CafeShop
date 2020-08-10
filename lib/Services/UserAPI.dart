import 'dart:convert';
import 'package:cafeshop/Models/ListProducts.dart';
import 'package:cafeshop/Models/Product.dart';
import 'package:cafeshop/Models/User.dart';
import 'package:http/http.dart';
import '../Models/User.dart';

// User _user;
Future<User> loginUser(String userName, String password) async {
  String url = "http://192.168.1.2:8000/login";
  print(userName);
  print(password);
  String json = '{"userName": "$userName", "password": $password}';
  print(json);

  Response response = await post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: json);

  if (response.statusCode == 200) {
    print(response.body);
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fail to fetch data');
  }
}
