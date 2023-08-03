import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/common_widgets/buttons/google_signin_button.dart';
import 'package:login_app/features/authentication/controllers/login_controller.dart';
import 'package:login_app/features/authentication/screens/login/login_screen.dart';

import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class SignupFooterWidget extends StatelessWidget {
  const SignupFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Column(
      children: [
        const Text('OR'),
        const SizedBox(height: tFormHeight - 20),
        TGoogleSignInButton(controller: controller),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () {
            Get.off(() => const LoginScreen());
          },
          child: Text.rich(
            TextSpan(
              text: tDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: tLogin,
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
