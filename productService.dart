import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/domain/models/products.dart';

class ProductService {
  /*
  static const baseUrl = Config.apiUrl;
  static Future<List<Product>> getProducts() async {
    var url = Uri.parse('$baseUrl${Config.pieces}');
    final response = await http.get(url);
    final List products = jsonDecode(response.body) as List<dynamic>;
    return products.map((product) => Product.fromJson(product)).toList();
  }*/
  static Future<List<Product>> getProducts() async {
    var url = Uri.parse('http://localhost:8080/api/products');
    final response = await http.get(url);

    // Este cambio te permite manejar errores en la respuesta HTTP
    if (response.statusCode != 200) {
      throw Exception('Error al obtener los productos');
    }

    // Este cambio usa la función `compute()` para decodificar el cuerpo de la respuesta en un hilo de fondo
    return compute(convertirLista, response.body);
  }

  static List<Product> convertirLista(String responseBody) {
    final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

    // Este cambio imprime el JSON decodificado en la consola
    print(pasar);

    return pasar.map<Product>((json) => Product.fromJson(json)).toList();
  }
  /*
  // crear producto
  static Future<Product> postProduct(Product product) async {
    var url = '$baseUrl${Config.pieces}';
    final response = await http.post(url as Uri, body: product.toJson());
    if (response.statusCode == 201) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error al crear el producto");
    }
  }
//obtener un producto
  static Future<Product> getProduct(int id) async {
    var url = '$baseUrl${Config.pieces}/$id';
    final response = await http.get(url as Uri);
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Producto no encontrado");
    }
  }
//buscar un  producto
  static Future<List<Product>> searchProduct(String key) async {
    var url = '$baseUrl${Config.search}?key=$key';
    final response = await http.get(url as Uri);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body) as List<dynamic>;
      return results.map((result) => Product.fromJson(result)).toList();
    } else {
      throw Exception("Producto no encontrado");
    }
  }*/
}
