import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:login_app/features/authentication/controllers/login_controller.dart';
import 'package:login_app/features/authentication/screens/forget_password/forget_password_options/forgot_password_bottom_model_sheet.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* -- Email Text Field -- */

            TextFormField(
              controller: controller.email,
              enableSuggestions: false,
              validator: (value) => controller.validateEmail(value),
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

            Obx(
              () => TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Enter your password';
                  return null;
                },
                controller: controller.password,
                enableSuggestions: false,
                obscureText: controller.showPassword.value ? false : true,
                decoration: InputDecoration(
                  labelText: tPassword,
                  hintText: tPassword,
                  suffixIcon: IconButton(
                    onPressed: () => controller.showPassword.value =
                        !controller.showPassword.value,
                    icon: controller.showPassword.value
                        ? const FaIcon(FontAwesomeIcons.eye, size: 20,)
                        : const FaIcon(FontAwesomeIcons.eyeSlash, size: 20,)
                  ),
                  prefixIcon: const Icon(Icons.fingerprint),
                ),
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
                  if (controller.loginFormKey.currentState!.validate()) {
                    controller.login();
                  }
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
