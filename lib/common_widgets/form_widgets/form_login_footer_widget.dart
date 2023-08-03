import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/authentication/controllers/login_controller.dart';
import 'package:login_app/features/authentication/screens/signup/signup_screen.dart';

import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../buttons/google_signin_button.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      children: [
        const Text('OR'),
        const SizedBox(height: tFormHeight - 20),

        /* -- Google SignIn Button */

        TGoogleSignInButton(controller: controller),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () {
            Get.off(() => const SignupScreen());
          },
          child: Text.rich(
            TextSpan(
              text: tDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: tSignup,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


