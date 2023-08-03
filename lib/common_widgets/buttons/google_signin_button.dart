import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';
import '../../features/authentication/controllers/login_controller.dart';

class TGoogleSignInButton extends StatelessWidget {
  const TGoogleSignInButton({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          icon: controller.isGoogleLoading.value
              ? const SizedBox()
              : const Image(
                  image: AssetImage(tGoogleLogo),
                  width: 15,
                ),
          onPressed: controller.isGoogleLoading.value
              ? () {}
              : controller.isGoogleLoading.value
                  ? () {}
                  : () => controller.googleSignIn(),
          label: controller.isGoogleLoading.value
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: tPrimaryColor,
                        strokeWidth: 3.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(tLoading),
                  ],
                )
              : const Text(tSignInWithGoogle),
        ),
      ),
    );
  }
}
