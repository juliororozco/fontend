class Product {
  String id;
  String name;
  String category;
  List<String> imageUrl;
  String reference;
  double price;
  double oldPrice;
  String description;
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.reference,
    required this.price,
    required this.oldPrice,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      imageUrl: (json['imageUrl'] as List).cast<String>(),
      reference: json['reference'],
      price: json['price'].toDouble(),
      oldPrice: json['oldPrice'].toDouble(),
      description: json['description'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'reference': reference,
      'price': price,
      'oldPrice': oldPrice,
      'description': description,
    };
  }
}
