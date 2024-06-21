import 'package:firebasework/screens/home_page.dart';
import 'package:firebasework/services/auth.dart';
import 'package:firebasework/widgets/circular_icon_widget.dart';
import 'package:firebasework/widgets/or_sign_up_with_widget.dart';
import 'package:flutter/material.dart';

import '../resources/font_structure.dart';
import '../resources/image_paths.dart';
import '../resources/utils.dart';
import '../widgets/text_form_widget.dart';

final _formKey = GlobalKey<FormState>();

class LoginContentWidget extends StatefulWidget {
  const LoginContentWidget({
    super.key,
    required this.signUp,
  });
  final bool signUp;

  @override
  State<LoginContentWidget> createState() => _LoginContentWidgetState();
}

class _LoginContentWidgetState extends State<LoginContentWidget> {
  Color buttonColor = Colors.blue;

  bool _loading = false;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  void onClicked() {
    setState(() {
      if (buttonColor == Colors.blue) {
        buttonColor = Colors.lightBlueAccent;
      }
    });
    if (_formKey.currentState!.validate()) {
      _loading = true;
      buttonColor = Colors.blue;
      if (!widget.signUp) {
        AuthServices.getUser(email.text.toString(), password.text.toString())
            .then((onValue) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        }).onError((error, stackTrace) {
          _loading = false;
          Utils.toastMessage(error.toString());
        });
      } else {
        AuthServices.createUser(email.text.toString(), password.text.toString())
            .then((onValue) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        }).onError((error, stackTrace) {
          _loading = false;
          Utils.toastMessage(error.toString());
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagePaths.loginTopImage,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.signUp ? 'Sign Up Details' : 'Login Details',
                    style: FontStructure.heading1,
                  ),
                  widget.signUp
                      ? TextFormWidget(
                          controller: username, hintText: 'Username')
                      : const SizedBox(),
                  TextFormWidget(
                    controller: email,
                    hintText: widget.signUp
                        ? 'email'
                        : 'Username, email & phone number',
                  ),
                  TextFormWidget(
                    controller: password,
                    hintText: 'Password',
                    obsecured: true,
                  ),
                  widget.signUp
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: FontStructure.bodyText1,
                              )),
                        )
                      : const SizedBox(
                          height: 20,
                        ),
                  GestureDetector(
                    onTap: onClicked,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: _loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              widget.signUp ? 'Sign Up' : 'Login',
                              style: FontStructure.button,
                            ),
                    ),
                  ),
                  const OrSignUpWithWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularIconWidget(
                        imagePath: ImagePaths.googleLogo,
                      ),
                      CircularIconWidget(
                        imagePath: ImagePaths.facebookLogo,
                      ),
                      CircularIconWidget(
                        imagePath: ImagePaths.appleLogo,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
