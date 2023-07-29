import 'package:flutter/material.dart';
import 'package:login_app/common_widgets/form_widgets/form_header_widget.dart';
import 'package:login_app/common_widgets/form_widgets/form_signup_footer_widget.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/common_widgets/form_widgets/form_login_footer_widget.dart';
import 'package:login_app/features/authentication/screens/login/login_screen.dart';
import 'package:login_app/features/authentication/screens/signup/signup_form_widget.dart';
import 'package:login_app/features/authentication/screens/welcome/welcome_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  imageHeight: 0.2,
                  formTitle: tSignUpTitle,
                  formSubtitle: tSignUpSubTitle,
                  image: tOnBoradingImage2,
                ),
                SignupFormWidget(),
                SignupFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
