import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/authentication/screens/forget_password/forget_password_options/forgot_password_bottom_model_sheet.dart';
import 'package:login_app/features/core/screens/dashboard/dashboard_screen.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* -- Email Text Field -- */

            TextFormField(
              decoration: const InputDecoration(
                labelText: tEmail,
                hintText: tEmail,
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                ),
              ),
            ),
            const SizedBox(height: tFormHeight),

            /* -- Password Text Field -- */

            TextFormField(
              enableSuggestions: false,
              obscureText: true,
              decoration: InputDecoration(
                labelText: tPassword,
                hintText: tPassword,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
                prefixIcon: const Icon(Icons.fingerprint),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            /* -- Forgot Password -- */

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgotPasswordScreen.forgotPasswordBottomModelSheet(context);
                },
                child: const Text(tForgetPassword),
              ),
            ),
            /* -- Log in Button -- */

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const DashboardScreen());
                },
                child: Text(
                  tLogin.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
