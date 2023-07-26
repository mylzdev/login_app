import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/authentication/screens/forget_password/forget_password_mail/forgot_password_mail_screen.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'forgot_password_btn_widget.dart';

class ForgotPasswordScreen {
  static Future<dynamic> forgotPasswordBottomModelSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgetPasswordTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              tForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),
            ForgetPasswordBtnWidget(
                icon: Icons.email_outlined,
                title: tEmail,
                subTitle: tResetViaEMail,
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => const ForgotPasswordMailScreen());
                }),
            const SizedBox(height: 20),
            ForgetPasswordBtnWidget(
              icon: Icons.mobile_friendly_rounded,
              title: tPhoneNo,
              subTitle: tResetViaPhone,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
