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
  });

  @override
  State<LoginContentWidget> createState() => _LoginContentWidgetState();
}

class _LoginContentWidgetState extends State<LoginContentWidget> {
  Color buttonColor = Colors.blue;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
    password.dispose();
  }

  void onClicked() {
    setState(() {
      if (buttonColor == Colors.blue) {
        buttonColor = Colors.lightBlueAccent;
      }
    });
    if (_formKey.currentState!.validate()) {
      buttonColor = Colors.blue;
      AuthServices.auth
          .signInWithEmailAndPassword(
              email: username.text.toString(),
              password: password.text.toString())
          .then((onValue) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
      }).onError((error, stackTrace) {
        Utils.toastMessage(error.toString());
      });
      // AuthServices.auth
      //     .createUserWithEmailAndPassword(
      //         email: username.text.toString(),
      //         password: password.text.toString())
      //     .then((onValue) {})
      //     .onError((error, stackTrace) {
      //   Utils.toastMessage(error.toString());
      // });
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),
      //   (route) => false,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                ImagePaths.loginTopImage,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Login Details',
                style: FontStructure.heading1,
              ),
              TextFormWidget(
                controller: username,
                hintText: 'Username, email & phone number',
              ),
              TextFormWidget(
                controller: password,
                hintText: 'Password',
                obsecured: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: FontStructure.bodyText1,
                    )),
              ),
              GestureDetector(
                onTap: onClicked,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    'Login',
                    style: FontStructure.button,
                  ),
                ),
              ),
              OrSignUpWithWidget(),
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
        ));
  }
}
