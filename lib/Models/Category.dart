import 'dart:convert';

import 'Product.dart';

class Category {
  String id;
  String name;
  List<dynamic> products;
  Product product;
  Category({this.id, this.name, this.products});
  factory Category.fromJson(Map<String, dynamic> json) {
    List<dynamic> listProducts = new List<dynamic>();
    for (var item in json['products']) {
      listProducts.add(new Product(
          id: item['id'],
          productName: item['productName'],
          productDescription: item['productDescription'],
          categoryId: item['categoryId'],
          mainImage: item['mainImage']));
    }
    // .map((item) {
    //   return Product(
    //       id: item['id'],
    //       productName: item['productName'],
    //       productDescription: item['productDescription'],
    //       sizes: item['sizes'],
    //       categoryId: item['categoryId'],
    //       images: item['images'],
    //       mainImage: item['mainImage']);
    // });
    return Category(id: json['id'], name: json['name'], products: listProducts);
  }
}
