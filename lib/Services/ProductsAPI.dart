import 'dart:convert';

import 'package:cafeshop/Models/ListProducts.dart';
import 'package:cafeshop/Models/Product.dart';

import 'package:http/http.dart' as http;

import '../Models/Product.dart';
import '../Models/Product.dart';
import '../Models/Product.dart';

Future<ListProduct> fetchProduct() async {
  final response = await http
      .get(Uri.encodeFull('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    var list = jsonDecode(response.body)
        .map((item) => Product.fromJson(item))
        .toList();
    ListProduct prod = new ListProduct(listProduct: list);
    return prod;
  } else {
    throw Exception('fail to fetch data');
  }
}
