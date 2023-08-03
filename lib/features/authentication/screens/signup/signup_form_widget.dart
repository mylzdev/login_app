import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/features/authentication/controllers/signup_controller.dart';
import 'package:login_app/utils/auth_function/validate_email.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: controller.signupForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* -- Fullname Text Field */

            TextFormField(
              validator: (value) =>
                  TextFieldValidation.fullnameValidation(value),
              controller: controller.fullname,
              decoration: const InputDecoration(
                labelText: tFullName,
                hintText: tFullName,
                prefixIcon: Icon(LineAwesomeIcons.user_1),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            /* -- Email Text Field */

            TextFormField(
              controller: controller.email,
              validator: (value) => TextFieldValidation.validateEmail(value),
              decoration: const InputDecoration(
                labelText: tEmail,
                hintText: tEmail,
                prefixIcon: Icon(LineAwesomeIcons.envelope),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            /* -- Phone Text Field */

            TextFormField(
              controller: controller.phoneNo,
              keyboardType: TextInputType.phone,
              validator: (value) =>
                  TextFieldValidation.phoneNoValidation(value),
              decoration: const InputDecoration(
                labelText: tPhoneNo,
                hintText: tPhoneNo,
                prefixIcon: Icon(LineAwesomeIcons.phone),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            /* -- Password Text Field */

            Obx(
              () => TextFormField(
                validator: (value) =>
                    TextFieldValidation.passwordValidation(value),
                controller: controller.password,
                enableSuggestions: false,
                obscureText: controller.showPassword.value ? false : true,
                decoration: InputDecoration(
                  labelText: tPassword,
                  hintText: tPassword,
                  prefixIcon: const Icon(LineAwesomeIcons.lock),
                  suffixIcon: IconButton(
                      onPressed: () => controller.showPassword.value =
                          !controller.showPassword.value,
                      icon: controller.showPassword.value
                          ? const Icon(FontAwesomeIcons.eye, size: 20)
                          : const Icon(FontAwesomeIcons.eyeSlash, size: 20)),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 10),

            /* -- Signup Button */

            Obx(
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.signupForm.currentState!.validate()) {
                      controller.createUser();
                      // Phone Authentication sign up
                      // SignUpController.instance
                      //     .phoneAuthentication(controller.phoneNo.text.trim());
                      //     Get.to(() => const OTPScreen());
                    }
                  },
                  child: controller.isLoading.value
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
                      : Text(
                          tSignup.toUpperCase(),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
