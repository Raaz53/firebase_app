class UserModel {
  final String? uid;
  final String username;
  final String email;
  final String phoneNumber;
  final String password;

  UserModel(
      {this.uid,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.password});

  toJson() {
    return {
      "FullName": username,
      "Email": email,
      "Phone": phoneNumber,
      "password": password
    };
  }
}
