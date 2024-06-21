import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasework/screens/home_page.dart';
import 'package:firebasework/screens/welcome_page.dart';
import 'package:firebasework/services/auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthServices.auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        log('Stream Data : ${snapshot.data}');
        if (snapshot.hasData) {
          return const HomePage();
        }
        return const WelcomePage();
      },
    );
  }
}
