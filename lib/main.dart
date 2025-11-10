import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'providers/user_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/orders_provider.dart';
import 'modules/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Firebase
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY']!,
      authDomain: dotenv.env['AUTH_DOMAIN'],
      projectId: dotenv.env['PROJECT_ID'],
      storageBucket: dotenv.env['STORAGE_BUCKET'],
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'],
      appId: dotenv.env['APP_ID'],
    ),
  );

  runApp(UserApp());
}

class UserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
      ],
      child: MaterialApp(
        title: 'User App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
      ),
    );
  }
}
