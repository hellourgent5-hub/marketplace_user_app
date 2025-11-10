import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> signIn(String email, String password) async {
    final res = await _auth.signInWithEmailAndPassword(email: email, password: password);
    user = res.user;
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    final res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    user = res.user;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    user = null;
    notifyListeners();
  }
}

