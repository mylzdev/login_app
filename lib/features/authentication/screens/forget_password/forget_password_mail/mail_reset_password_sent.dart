import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';

class MailResetPasswordScreen extends StatelessWidget {
  const MailResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: tDefaultSize * 3),
          width: double.infinity,
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                LineAwesomeIcons.envelope_open,
                size: 100,
              ),
              const SizedBox(height: tDefaultSize - 10),
              Text(
                tVerifyEmail,
                style: txtTheme.headlineMedium,
              ),
              const SizedBox(height: tDefaultSize - 10),
              Text(
                tForgetMailSubTitle,
                textAlign: TextAlign.center,
                style: txtTheme.bodyMedium,
              ),
              const SizedBox(height: tDefaultSize),
              TextButton(
                onPressed: () {
                  AuthenticationRepository.instance.logout();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LineAwesomeIcons.arrow_left,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text(tBackToLogin),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
