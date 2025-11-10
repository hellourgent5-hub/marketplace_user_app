import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (_, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text('\$${item['price']} x ${item['quantity']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => cart.removeItem(index),
            ),
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        child: Text('Checkout \$${cart.totalPrice}'),
        onPressed: () => cart.checkout(),
      ),
    );
  }
}

