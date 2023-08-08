import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/constants/colors.dart';
import 'package:login_app/constants/sizes.dart';

class Helper extends GetxController {

  static successSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.green.withOpacity(0.1),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(tDefaultSize - 10),
      icon: const Icon(
        LineAwesomeIcons.check_circle,
        color: tWhiteColor,
      ),
    );
  }

  static errorSnackbar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(tDefaultSize - 10),
      icon: const Icon(
        LineAwesomeIcons.check_circle,
        color: Colors.red,
      ),
    );
  }

}
