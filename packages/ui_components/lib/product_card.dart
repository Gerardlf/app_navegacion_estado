import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  final String id;
  final String name;
  final double precio;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.id,
    required this.name,
    required this.precio,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Código: $id \n Articulo: $name"),
        subtitle: Text("${precio.toStringAsFixed(2)} €"),
        trailing: ElevatedButton(onPressed: onAdd, child: const Text("Añadir")),
      ),
    );
  }
}
