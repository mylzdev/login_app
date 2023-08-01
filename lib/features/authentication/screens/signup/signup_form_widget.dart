import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/authentication/controllers/signup_controller.dart';
import 'package:login_app/features/authentication/models/user_model.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullname,
              decoration: const InputDecoration(
                labelText: tFullName,
                hintText: tFullName,
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                labelText: tEmail,
                hintText: tEmail,
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                labelText: tPhoneNo,
                hintText: tPhoneNo,
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.password,
              decoration: InputDecoration(
                labelText: tPassword,
                hintText: tPassword,
                prefixIcon: const Icon(Icons.person_outline_outlined),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Email and password sign up
                    // controller.registerUser(
                    //   controller.email.text.trim(),
                    //   controller.password.text.trim(),
                    // );

                    // Phone Authentication sign up
                    // SignUpController.instance
                    //     .phoneAuthentication(controller.phoneNo.text.trim());
                    //     Get.to(() => const OTPScreen());

                    // Database sign up
                    final user = UserModel(
                        fullname: controller.fullname.text.trim(),
                        email: controller.email.text.trim(),
                        phoneNo: controller.phoneNo.text.trim(),
                        password: controller.password.text.trim());
                        SignUpController.instance.createUser(user);
                  }
                },
                child: Text(
                  tSignup.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
