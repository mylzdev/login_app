import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/common_widgets/form_widgets/form_header_widget.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/controllers/forgot_password_controller.dart';
import 'package:login_app/utils/auth_function/validate_email.dart';

import '../../../../../constants/colors.dart';

class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              const SizedBox(height: tDefaultSize * 4),
              const FormHeaderWidget(
                imageHeight: 0.2,
                formTitle: tForgetPassword,
                formSubtitle: tForgetPasswordSubTitle,
                image: tOnBoradingImage1,
                heightBetween: 30,
                crossAxisAlignment: CrossAxisAlignment.center,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: tFormHeight),
              Column(
                children: [
                  Form(
                    key: controller.forgotPasswordKey,
                    child: TextFormField(
                      validator: (email) =>
                          TextFieldValidation.validateEmail(email),
                      controller: controller.email,
                      decoration: const InputDecoration(
                        labelText: tEmail,
                        hintText: tEmail,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.forgotPasswordKey.currentState!
                              .validate()) {
                            controller.sendPasswordResetCodeToEmail();
                          }
                        },
                        child: controller.isLoading
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
                                  Text(tNext)
                                ],
                              )
                            : const Text(tNext),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
