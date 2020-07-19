class Product {
  int id;
  int userId;
  String body;
  String title;
  Product({this.id, this.body, this.title, this.userId});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      userId: json['userId'],
      body: json['body'],
      title: json['title'],
    );
  }
}
