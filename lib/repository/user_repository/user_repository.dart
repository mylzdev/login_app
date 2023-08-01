import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Store user in Firestore
  createUser(UserModel user) async {
    await _db
        .collection('Users')
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            'Success',
            'Your account has been created.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        .catchError((error, stackStrace) {
      Get.snackbar('Error', 'Something went wrong. Try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      return error;
    });
  }

  // Fetch all users or user details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapShot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapShot(e)).toList();
    return userData;
  }
}
