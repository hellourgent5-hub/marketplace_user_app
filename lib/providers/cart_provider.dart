
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> items = [];

  void addItem(Map<String, dynamic> product) {
    items.add({...product, 'quantity': 1});
    notifyListeners();
  }

  void removeItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (var item in items) total += item['price'] * item['quantity'];
    return total;
  }

  void checkout() {
    // implement checkout logic (Firebase order creation)
    items.clear();
    notifyListeners();
  }
}
