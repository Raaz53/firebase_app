import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasework/screens/spash_page.dart';
import 'package:flutter/material.dart';

class AuthServices {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User?> createUser(
    String email,
    String password,
  ) async {
    final userCred = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = userCred.user;
    return user;
  }

  static Future<User?> getUser(String email, String password) async {
    final userCred =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final user = userCred.user;
    return user;
  }

  static void signingOut(BuildContext context) async {
    await auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SplashPage()),
        (route) => false);
  }
}
