import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersProvider extends ChangeNotifier {
  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('orders');

  Future<void> placeOrder(Map<String, dynamic> order) async {
    await ordersCollection.add(order);
  }
}

