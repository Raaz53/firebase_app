import 'package:firebasework/resources/font_structure.dart';
import 'package:flutter/material.dart';

class OrSignUpWithWidget extends StatelessWidget {
  const OrSignUpWithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 3,
            width: 100,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.blue],
                    begin: Alignment.centerLeft)),
          ),
          Text(
            'Or Sign up With',
            style: FontStructure.bodyText3,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 3,
            width: 100,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue,
              Colors.transparent,
            ], begin: Alignment.centerLeft)),
          ),
        ],
      ),
    );
  }
}
