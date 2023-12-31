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
        .collection("Users")
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

  // Fetch single user details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromJson(e)).single;
    return userData;
  }

  // Fetch all users details
  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromJson(e)).toList();
    return userData;
  }

  Future<void> deleteUserFromDatabase(String uid) async =>
      await _db.collection('Users').doc(uid).delete();

  Future<void> updateUserRecord(UserModel user) async {
    await _db
        .collection("Users")
        .doc(user.id)
        .update(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            'Success',
            'Your have updated your account.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        .catchError((error, stackStrace) {
      Get.snackbar(
        'Error',
        '$error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    });
  }
}
