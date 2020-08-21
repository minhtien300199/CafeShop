class Product {
  String id;
  String productName;
  String productDescription;
  String hot;
  String popular;
  String price;
  String categoryId;
  String mainImage;
  List<dynamic> sizes;
  List<dynamic> images;
  Product(
      {this.id,
      this.productName,
      this.productDescription,
      this.sizes,
      this.hot,
      this.popular,
      this.price,
      this.categoryId,
      this.images,
      this.mainImage});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        productName: json['productName'],
        productDescription: json['productDescription'],
        hot: json['hot'],
        popular: json['popular'],
        price: json['price'],
        sizes: json['sizes'],
        categoryId: json['categoryId'],
        images: json['images'],
        mainImage: json['mainImage']);
  }
}
