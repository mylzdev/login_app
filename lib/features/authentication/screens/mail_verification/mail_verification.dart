import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/controllers/mail_controller.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';

class MailVerificationScreen extends StatelessWidget {
  const MailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: tDefaultSize * 3),
              const Icon(LineAwesomeIcons.envelope_open, size: 100),
              const SizedBox(height: tDefaultSize),
              Text(
                tVerifyEmail,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: tDefaultSize - 10),
              const Text(
                tVerifyEmailSend,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: tDefaultSize - 10),
              const Text(
                tIfNotRedirect,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: tDefaultSize),
              /* -- Continue button */
              SizedBox(
                width: 170,
                child: OutlinedButton(
                  onPressed: () {
                    controller.manuallyCheckEmailVerificationStatus();
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    tContinue,
                  ),
                ),
              ),
              const SizedBox(height: tDefaultSize),
              /* -- Text Buttons -- */
              TextButton(
                onPressed: () {
                  controller.sendVerificationEmail();
                },
                child: const Text(tResendEmail),
              ),
              TextButton(
                  onPressed: () {
                    AuthenticationRepository.instance.logout();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LineAwesomeIcons.arrow_left),
                      Text(tBackToLogin)
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
