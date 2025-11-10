import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class PharmacyPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Paracetamol', 'price': 0.5},
    {'name': 'Vitamin C', 'price': 1.0},
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Pharmacy')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text('\$${product['price']}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () => cart.addItem(product),
            ),
          );
        },
      ),
    );
  }
}

