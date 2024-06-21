import 'package:flutter/material.dart';

import '../resources/font_structure.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'FireBase',
          style: FontStructure.heading2,
        ),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
