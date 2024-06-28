import 'dart:developer';
import 'dart:io';

import 'package:firebasework/models/user_model.dart';
import 'package:firebasework/services/auth.dart';
import 'package:firebasework/services/user_data.dart';
import 'package:firebasework/widgets/circular_avatar_widget.dart';
import 'package:firebasework/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

import '../services/firebase_image.dart';

final _formKey = GlobalKey<FormState>();

class EditPage extends StatefulWidget {
  const EditPage({super.key, this.user});
  final UserModel? user;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController username;
  late TextEditingController phoneNumber;

  String? imagePath;
  String? imageUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = TextEditingController(text: widget.user?.username);
    phoneNumber = TextEditingController(text: widget.user?.phoneNumber);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
    phoneNumber.dispose();
  }

  Future<void> onClicked() async {
    if (_formKey.currentState!.validate()) {
      if (imagePath != null) {
        imageUrl = await FirebaseImage.uploadPic(File(imagePath!));
        log('image uploaded : $imageUrl');
      }
      log('image not uploaded : $imageUrl');
      UserModel users = UserModel(
          uid: widget.user!.uid,
          username: username.text.toString(),
          email: widget.user!.email,
          phoneNumber: phoneNumber.text.toString(),
          password: widget.user!.password,
          profile: imageUrl ?? widget.user!.profile);

      AuthServices.updateUser(users);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CircularAvatarWidget(
                  radius: 100,
                  existingImage: widget.user?.profile,
                  uploadedImage: (image) {
                    log('this image : $image');
                    setState(() {
                      imagePath = image;
                    });
                  },
                ),
                TextFormWidget(controller: username, hintText: 'Your Name'),
                TextFormWidget(
                    controller: phoneNumber, hintText: 'Phone Number'),
                const SizedBox(
                  height: 150,
                ),
                GestureDetector(
                  onTap: onClicked,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text('Edit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
