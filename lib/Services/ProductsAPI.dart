import 'dart:convert';
import 'package:cafeshop/Models/ListProducts.dart';
import 'package:cafeshop/Models/Product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Models/Product.dart';

Future<ListProduct> fetchProduct() async {
  final response = await http
      .get(Uri.encodeFull("http://hieuit.tech:8000/products/hotproduct"));
  if (response.statusCode == 200) {
    var list = jsonDecode(response.body)['data']
        .map((item) => Product.fromJson(item))
        .toList();
    ListProduct prod = new ListProduct(listProduct: list);
    return prod;
  } else {
    throw Exception('fail to fetch data');
  }
}
