import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OTPController());
    var otp;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tOtpTitle,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 80.0,
                ),
              ),
              Text(
                tOtopSubtitle.toUpperCase(),
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 30.0),
              const Text(
                '$tOtpMessage johnmilesmorales16@gmail.com',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                child: OtpTextField(
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.1),
                  textStyle: Theme.of(context).textTheme.titleLarge,
                  numberOfFields: 6,
                  focusedBorderColor: Colors.black,
                  onSubmit: (code) {
                    otp = code;
                    controller.verifyOTP(otp);
                  },
                  margin: const EdgeInsets.only(right: 12),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.verifyOTP(otp);
                  },
                  child: const Text(tNext),
                ),
              ),
              const SizedBox(height: tDefaultSize * 4),
            ],
          ),
        ),
      ),
    );
  }
}
