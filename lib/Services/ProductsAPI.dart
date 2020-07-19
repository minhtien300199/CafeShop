import 'package:cafeshop/Models/Product.dart';

import 'package:http/http.dart' as http;

Future<http.Response> fetchProduct() async {
  final response = await http
      .get(Uri.encodeFull('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    print(response.body);
    return response;
  } else {
    throw Exception('fail to fetch data');
  }
}
