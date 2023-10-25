class Product {
  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final String reference;
  final double price;
  final double? oldPrice;
  final String description;
  final int? v;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.reference,
    required this.price,
    this.oldPrice,
    required this.description,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      imageUrl: (json['imageUrl'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [], // Si 'imageUrl' es nulo, usa una lista vacía
      reference: json['reference'],
      price: json['price']?.toDouble() ?? 0.0,
      oldPrice: json['oldPrice']?.toDouble(),
      description: json['description'],
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'reference': reference,
      'price': price,
      'oldPrice': oldPrice,
      'description': description,
      'v': v
    };
  }
}
