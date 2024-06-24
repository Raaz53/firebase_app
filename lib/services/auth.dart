import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasework/models/user_model.dart';
import 'package:firebasework/screens/spash_page.dart';
import 'package:firebasework/services/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthServices {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final userRepo = Get.put(UserData());

  static Future<User?> registerUser(UserModel users) async {
    final userCred = await auth.createUserWithEmailAndPassword(
        email: users.email, password: users.password);
    await userRepo.createUser(users);
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

  static getUserData() {
    final email = auth.currentUser?.email;
    if (email != null) {
      return userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Inside getUserData');
    }
  }
}
