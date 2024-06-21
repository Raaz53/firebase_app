import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasework/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserData extends GetxController {
  static UserData get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel users) async {
    try {
      await _db.collection("users").add(users.toJson()).whenComplete(() {
        Get.snackbar('Success', 'Your account has been created.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.grey.withOpacity(0.1),
            colorText: Colors.green);
      });
    } catch (error) {
      print('Error:${error.toString()}');
      Get.snackbar('Error', '$error thrown',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.redAccent.withOpacity(0.1));
    }
  }
}
