class Product {
  String id;
  String productName;
  String productDescription;
  String categoryId;
  List<dynamic> sizes;
  List<dynamic> images;
  Product(
      {this.id,
      this.productName,
      this.productDescription,
      this.sizes,
      this.categoryId,
      this.images});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        productName: json['productName'],
        productDescription: json['productDescription'],
        sizes: json['sizes'],
        categoryId: json['categoryId'],
        images: json['images']);
  }
}
