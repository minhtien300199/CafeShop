import 'dart:convert';
import 'package:cafeshop/Models/ListProducts.dart';
import 'package:cafeshop/Models/Product.dart';
import 'package:cafeshop/Models/User.dart';
import 'package:http/http.dart' as http;
import '../Models/User.dart';

// User _user;
class UserAPI {
  Future<UserResponseModel> loginUser(User requestUser) async {
    String url = "http://192.168.1.2:8000/login";
    final response = await http.post(url, body: requestUser.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return UserResponseModel.fromJson(json.decode(response.body));
    } else {
      throw new Exception("Failed to load Data");
    }
  }
}
