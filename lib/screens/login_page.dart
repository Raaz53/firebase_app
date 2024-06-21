import 'package:firebasework/contents/login_content_widget.dart';
import 'package:firebasework/resources/image_paths.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.condition});

  final bool condition;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(ImagePaths.loginBottomImage)),
          LoginContentWidget(
            signUp: widget.condition,
          ),
        ],
      ),
    );
  }
}
