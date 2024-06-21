import 'package:firebasework/resources/image_paths.dart';
import 'package:flutter/material.dart';

class CircularIconWidget extends StatefulWidget {
  CircularIconWidget({super.key, required this.imagePath});

  final String imagePath;

  @override
  State<CircularIconWidget> createState() => _CircularIconWidgetState();
}

class _CircularIconWidgetState extends State<CircularIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(3),
      height: MediaQuery.of(context).size.width * 0.15,
      width: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        color: Color.fromRGBO(236, 233, 236, 1),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Image.asset(widget.imagePath),
    );
  }
}
