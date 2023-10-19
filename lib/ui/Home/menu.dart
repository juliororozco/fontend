import 'package:flutter/material.dart';
import 'package:frontend/ui/Products/listProduct.dart';
import 'package:frontend/ui/pages/Users/login/login.dart';
import 'package:frontend/ui/pages/Users/perfil/perfil.dart';
import '../Products/searchProduct.dart';
import '../pages/cart/cartPage.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('MotorCaribe'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Auteco'),
                Tab(text: 'Bajaj'),
                Tab(text: 'Suzuki'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ProductList(category: 'Auteco'),
              ProductList(category: 'Bajaj'),
              ProductList(category: 'Suzuki'),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductSearchAppBar(
                                onSearch: (String) {},
                              )),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
