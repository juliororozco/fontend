import 'package:flutter/material.dart';
import 'package:frontend/ui/Products/listProduct.dart';
import 'package:frontend/ui/pages/Users/login/login.dart';
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
                  icon: const Icon (Icons.home, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    // Navega a la pantalla de inicio de sesión (Login)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    // Acción cuando se presiona el ícono "Configuración"
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
