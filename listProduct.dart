import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/poductController.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController pc = Get.find();
    pc.listProducts();

    return ListView.builder(
      itemCount: pc.listaGeneralProduct.length,
      itemBuilder: (context, index) {
        final product = pc.listaGeneralProduct[index];
        return Card(
          margin: const EdgeInsets.all(8),
          elevation: 4,
          child: Column(
            children: [
              Image.network(
                product.imageUrl
                    as String, // Reemplaza con la URL de la imagen del producto
                height:
                    200, // Ajusta la altura de la imagen según tus necesidades
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}', // Formatea el precio
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
