import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> createUser(String email, String password) async {
    final userCred = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = userCred.user;
    return user;
  }
}
