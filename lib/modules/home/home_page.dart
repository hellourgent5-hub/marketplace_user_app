import 'package:flutter/material.dart';
import '../grocery/grocery_page.dart';
import '../pharmacy/pharmacy_page.dart';
import '../food_parcel/food_parcel_page.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Marketplace User App'), actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
          },
        )
      ]),
      body: ListView(
        children: [
          ListTile(
            title: Text('Grocery'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => GroceryPage())),
          ),
          ListTile(
            title: Text('Pharmacy'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PharmacyPage())),
          ),
          ListTile(
            title: Text('Food Parcel'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FoodParcelPage())),
          ),
        ],
      ),
    );
  }
}

