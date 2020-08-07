import 'dart:convert';
import 'package:cafeshop/Models/ListProducts.dart';
import 'package:cafeshop/Models/Product.dart';
import 'package:cafeshop/Models/User.dart';
import 'package:http/http.dart';
import '../Models/Product.dart';

class UserAPI {
  User _user;
  Future<String> loginUser(String userName, String password) async {
    String url = "https://caffeeshopbackend.herokuapp.com/login";
    String json = '{"userName": "$userName", "password": "$password"}';

    Response response = await post(url, body: json);

    if (response.statusCode == 200) {
      String userInfo = response.body;
      print(userInfo);
      return userInfo;
    } else {
      throw Exception('Fail to fetch data');
    }
  }
}
