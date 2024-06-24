import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String username;
  final String email;
  final String phoneNumber;
  final String password;

  UserModel(
      {this.uid,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.password});

  toJson() {
    return {
      "FullName": username,
      "Email": email,
      "Phone": phoneNumber,
      "password": password
    };
  }

  factory UserModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        uid: document.id,
        username: data["FullName"],
        email: data["Email"],
        phoneNumber: data["Phone"],
        password: data["password"]);
  }
}
