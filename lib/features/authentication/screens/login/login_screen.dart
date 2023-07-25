import 'package:flutter/material.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/features/authentication/screens/login/login_form_widget.dart';

import 'login_footer_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeaderWidget(height: height),
                const LoginFormWidget(),
                const LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
