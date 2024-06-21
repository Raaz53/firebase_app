import 'package:firebasework/resources/font_structure.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obsecured});
  final TextEditingController controller;
  final bool? obsecured;
  final String hintText;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          controller: widget.controller,
          maxLines: 1,
          validator: (value) {
            if (value == null || value.isEmpty || value.startsWith(' ')) {
              return "This field can't be empty";
            }
            return null;
          },
          obscureText: widget.obsecured ?? false,
          style: FontStructure.bodyText1,
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: FontStructure.bodyText1,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
        ),
      ),
    );
  }
}
