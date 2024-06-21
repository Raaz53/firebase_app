import 'package:firebasework/resources/image_paths.dart';
import 'package:firebasework/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(ImagePaths.loginTopImage),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButtonWidget(buttonLabel: 'Sign Up', condition: true),
                  ElevatedButtonWidget(buttonLabel: 'Login', condition: false)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
