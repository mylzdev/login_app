import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/common_widgets/form_widgets/form_header_widget.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

class ForgotPasswordPhoneScreen extends StatelessWidget {
  const ForgotPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                formSubtitle: tForgetPhoneSubTitle,
                image: tOnBoradingImage2,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: tFormHeight),
              Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: tPhoneNo,
                      hintText: tPhoneNo,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const OTPScreen());
                      },
                      child: const Text(tNext),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
