import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasework/models/user_model.dart';
import 'package:firebasework/resources/font_structure.dart';
import 'package:firebasework/services/auth.dart';
import 'package:firebasework/services/user_data.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    super.key,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Details",
          style: FontStructure.heading2,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: AuthServices.getUserData(),
          builder: (context, snapshot) {
            UserModel? details = snapshot.data as UserModel?;
            return Column(
              children: [
                Text(
                  "Name: ${details?.username}",
                  style: FontStructure.bodyText1,
                ),
                Text(
                  "Email: ${details?.email}",
                  style: FontStructure.bodyText1,
                ),
                Text(
                  "Phone Number: ${details?.phoneNumber}",
                  style: FontStructure.bodyText1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}