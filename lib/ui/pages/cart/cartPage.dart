
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartPage> {
  // Simulación de un carrito con algunos productos
  final Cart cart = Cart(
    userId: 'user123',
    products: [
      CartItem(cartItemId: 'item1', quantity: 2),
      CartItem(cartItemId: 'item2', quantity: 1),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Carrito de Compras'),
      ),
      body: ListView.builder(
        itemCount: cart.products.length,
        itemBuilder: (context, index) {
          final cartItem = cart.products[index];
          return ListTile(
            title: Text('Producto ID: ${cartItem.cartItemId}'),
            subtitle: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (cartItem.quantity > 1) {
                        cartItem.quantity--;
                      }
                    });
                  },
                ),
                Text('${cartItem.quantity}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      cartItem.quantity++;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
class CartItem {
  final String cartItemId;
  int quantity;

  CartItem({required this.cartItemId, this.quantity = 1});
}

class Cart {
  final String userId;
  final List<CartItem> products;

  Cart({required this.userId, required this.products});
}