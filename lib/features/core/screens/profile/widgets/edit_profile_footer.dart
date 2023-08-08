import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/authentication/models/user_model.dart';
import 'package:login_app/features/core/controllers/profile_controller.dart';

import '../../../../../constants/text_strings.dart';

class EditProfileFooter extends StatelessWidget {
  const EditProfileFooter({
    super.key,
    this.id,
    required this.email,
    required this.fullname,
    required this.password,
    required this.phoneNo,
  });

  final String? id;
  final String email;
  final String fullname;
  final String password;
  final String phoneNo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text.rich(
          TextSpan(
            text: tJoined,
            style: TextStyle(fontSize: 12),
            children: [
              TextSpan(
                text: tJoinedAt,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            elevation: 0,
            side: BorderSide.none,
            foregroundColor: Colors.red,
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            final user = UserModel(
              id: id,
              email: email,
              fullname: fullname,
              password: password,
              phoneNo: phoneNo,
            );
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Are you sure you want to delete your account?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        ProfileController.instance.deleteUserAccount(user);
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text(tDelete),
        ),
      ],
    );
  }
}
