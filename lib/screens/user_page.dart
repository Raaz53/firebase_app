import 'package:firebasework/models/user_model.dart';
import 'package:firebasework/resources/font_structure.dart';
import 'package:firebasework/screens/edit_page.dart';
import 'package:firebasework/services/auth.dart';
import 'package:firebasework/widgets/circular_avatar_widget.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    super.key,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserModel? user;

  Future<void> _refreshUserData() async {
    final userDetails = await AuthServices.getUserData();
    setState(() {
      user = userDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Details",
          style: FontStructure.heading2,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPage(
                              user: user,
                            )));
                if (result == true) {
                  _refreshUserData();
                }
              },
              icon: const Icon(Icons.edit))
        ],
        backgroundColor: Colors.grey[200],
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: AuthServices.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No user data found'));
              }

              UserModel? details = snapshot.data as UserModel?;
              user = details;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularAvatarWidget(
                    radius: 100,
                    existingImage: details?.profile,
                  ),
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
      ),
    );
  }
}
