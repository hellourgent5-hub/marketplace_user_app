import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class FoodParcelPage extends StatelessWidget {
  final List<Map<String, dynamic>> meals = [
    {'name': 'Burger', 'price': 5},
    {'name': 'Pizza', 'price': 8},
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Food Parcel')),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (_, index) {
          final meal = meals[index];
          return ListTile(
            title: Text(meal['name']),
            subtitle: Text('\$${meal['price']}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () => cart.addItem(meal),
            ),
          );
        },
      ),
    );
  }
}

