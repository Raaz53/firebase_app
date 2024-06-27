import 'package:firebasework/models/user_model.dart';
import 'package:firebasework/widgets/circular_avatar_widget.dart';
import 'package:firebasework/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, this.user});
  final UserModel? user;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController username;
  late TextEditingController phoneNumber;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              CircularAvatarWidget(
                radius: 100,
                existingImage: widget.user?.profile,
              ),
              TextFormWidget(controller: username, hintText: 'Your Name'),
              TextFormWidget(controller: phoneNumber, hintText: 'Phone Number'),
              const SizedBox(
                height: 150,
              ),
              GestureDetector(
                onTap: () {},
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
    );
  }
}
