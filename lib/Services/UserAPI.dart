import 'dart:convert';
import 'package:cafeshop/Models/ListProducts.dart';
import 'package:cafeshop/Models/Product.dart';
import 'package:cafeshop/Models/User.dart';
import 'package:http/http.dart' as http;
import '../Models/User.dart';

// User _user;
class UserAPI {
  Future addUser(User requestUser) async {
    String url = "http://hieuit.tech:8000/user/add";
    final response = await http.post(url, body: requestUser.toJson());
    print(response);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return true;
    } else {
      throw new Exception("Failed to load Data");
    }
  }
}
