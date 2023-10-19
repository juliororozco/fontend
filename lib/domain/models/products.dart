class Product {
  final String name;
  final String category;
  final List<String> imageUrl;
  final String reference;
  final double price;
  final double oldPrice;
  final String description;

  Product({
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
      name: json['name'],
      category: json['category'],
      imageUrl: json['imageUrl'].map((e) => e.toString()).toList(),
      reference: json['reference'],
      price: json['price'].toDouble(),
      oldPrice: json['oldPrice'].toDouble(),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
