import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../lib/domain/models/products.dart';

class ProductService {
  final String baseUrl;

  ProductService(this.baseUrl);

  Future<List<Product>> getProducts() async {
    var url = Uri.parse("${baseUrl}http://localhost:8080/api/products");
    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    final products = jsonDecode(response.body) as List<dynamic>;
    return products.map((product) => Product.fromJson(product)).toList();
  }

  Future<Product> postProduct(Product product) async {
    var url = Uri.parse("${baseUrl}http://localhost:8080/api/products");
    final response = await http.post(url, body: product.toJson());
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error al crear el producto");
    }
  }

  Future<Product> getProduct(int id) async {
    var url = Uri.parse("${baseUrl}http://localhost:8080/api/products/:id");

    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Producto no encontrado");
    }
  }

  Future<List<Product>> searchProduct(String key) async {
    var url = Uri.parse("${baseUrl}http://localhost:8080/api/products/search/$key");

    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body) as List<dynamic>;
      return results.map((result) => Product.fromJson(result)).toList();
    } else {
      throw Exception("Producto no encontrado");
    }
  }
}
