import 'package:flutter/material.dart';
import 'package:frontend/ui/Products/cardsProduct.dart';

class ProductList extends StatelessWidget {
  final String category;
  ProductList({required this.category});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3, 
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProductCard(),
        );
      },
    );
  }
}