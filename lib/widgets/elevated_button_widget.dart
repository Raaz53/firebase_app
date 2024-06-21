import 'package:firebasework/resources/font_structure.dart';
import 'package:firebasework/screens/login_page.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatefulWidget {
  const ElevatedButtonWidget(
      {super.key, required this.buttonLabel, required this.condition});
  final String buttonLabel;
  final bool condition;
  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage(
                      condition: widget.condition,
                    )));
      },
      child: Text(
        widget.buttonLabel,
        style: FontStructure.heading3,
      ),
    );
  }
}
