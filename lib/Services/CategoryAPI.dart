import 'dart:convert';
import 'package:cafeshop/Models/Category.dart';
import '../Models/ListCategory.dart';
import 'package:http/http.dart' as http;

Future<ListCategory> fetchCategory() async {
  final response =
      await http.get(Uri.encodeFull("http://hieuit.tech:8000/category/all"));
  if (response.statusCode == 200) {
    print(jsonDecode(response.body)['data']);
    List<dynamic> list = jsonDecode(response.body)['data']
        .map((item) => Category.fromJson(item))
        .toList();
    ListCategory cats = new ListCategory(listCategory: list);
    // LocalStore local = new LocalStore();
    // local.saveData(cats, 'listCategory');
    // print(LocalStore.storage.getItem('listCategory'));
    return cats;
    // return LocalStore.storage.getItem('listCategory');
  } else {
    throw Exception("Không lấy được dữ liệu");
  }
}
