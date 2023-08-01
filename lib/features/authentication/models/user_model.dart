import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String password;
  final String phoneNo;

  UserModel({
    this.id,
    required this.email,
    required this.fullname,
    required this.password,
    required this.phoneNo,
  });

  toJson() {
    return {
      'Email': email,
      'Fullname': fullname,
      'Password': password,
      'Phone': phoneNo,
    };
  }

  // Map user fetched from friebase to usermodel
  factory UserModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      fullname: data["Fullname"],
      password: data["Password"],
      phoneNo: data["Phone"],
    );
  }
}
