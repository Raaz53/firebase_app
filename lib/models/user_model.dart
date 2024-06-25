import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String username;
  final String email;
  final String phoneNumber;
  final String password;
  final String? profile;

  UserModel(
      {this.uid,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.password,
      this.profile});

  toJson() {
    return {
      "FullName": username,
      "Email": email,
      "Phone": phoneNumber,
      "password": password,
      "profile": profile,
    };
  }

  factory UserModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      uid: document.id,
      username: data["FullName"],
      email: data["Email"],
      phoneNumber: data["Phone"],
      password: data["password"],
      profile: data['profile'],
    );
  }
}
