import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasework/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class UserData extends GetxController {
  static UserData get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel users) async {
    try {
      await _db.collection("users").add(users.toJson()).whenComplete(() {
        EasyLoading.showToast(
          'Success Your account has been created.',
          toastPosition: EasyLoadingToastPosition.bottom,
        );
      });
    } catch (error) {
      print('Error:${error.toString()}');
      EasyLoading.showError(
        '$error thrown',
      );
      // Get.snackbar('Error', '$error thrown',
      //     snackPosition: SnackPosition.BOTTOM,
      //     colorText: Colors.red,
      //     backgroundColor: Colors.redAccent.withOpacity(0.1));
    }
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromDoc(e)).single;
    return userData;
  }
}
