import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/features/core/controllers/profile_controller.dart';

import '../../../../../constants/colors.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.onPress,
    this.hasTrailingIcon = true,
    this.textColor,
  });

  final IconData leadingIcon;
  final String title;
  final bool hasTrailingIcon;
  final VoidCallback onPress;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: controller.isDarkMode.value || isDarkMode
              ? tPrimaryColor.withOpacity(0.2)
              : tPrimaryColor.withOpacity(0.1),
        ),
        child: Icon(
          leadingIcon,
          color: controller.isDarkMode.value || isDarkMode
              ? tPrimaryColor
              : tWhiteColor
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.apply(color: textColor),
      ),
      trailing: hasTrailingIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                color: Colors.grey,
                size: 18,
              ),
            )
          : null,
    );
  }
}
