class ProductsEntity {
  final int id;
  final String name;
  final double price;
  final String picture;
  final String created;

  ProductsEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.picture,
    required this.created
  });

  factory ProductsEntity.fromJson(Map<String, dynamic> json) {
    return ProductsEntity(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      picture: json['picture'],
      created: json['created'],
    );
  }

}