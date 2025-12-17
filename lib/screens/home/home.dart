import 'package:app_navegacion_estado/state/cartViewModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cart.count > 0)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      child: Text(
                        cart.count.toString(),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () => context.goNamed("cart"),
          ),
        ],
      ),
      body: Center(child: Text("Pantalla home")),
    );
  }
}
