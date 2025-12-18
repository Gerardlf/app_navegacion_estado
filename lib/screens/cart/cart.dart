import 'package:app_navegacion_estado/state/cartViewModel.dart';
import 'package:app_navegacion_estado/widgets/responsive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();

    return ResponsiveScaffold(
      currentIndex: 1,
      onTab: (value) {
        if (value == 0) context.goNamed("home");
        if (value == 1) context.goNamed("cart");
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            "Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delivery_dining_sharp, color: Colors.white),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.count,
                itemBuilder: (context, i) {
                  final producto = cart.items[i];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        title: Text(
                          "Código: ${producto.id} \nArticulo: ${producto.nombre}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "Precio: ${producto.precio}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        trailing: ElevatedButton.icon(
                          icon: Icon(Icons.delete),
                          onPressed: () => cart.removeProduct(producto),
                          label: Text("Eliminar"),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.shopping_bag_rounded,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Seguir Comprando",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () => context.goNamed("home"),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.payment, color: Colors.white),
                      label: Text(
                        "Pagar ${cart.total}",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () => context.goNamed("payment"),
                    ),
                  ), //No hay navegacion a pagar!!!!!!
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
