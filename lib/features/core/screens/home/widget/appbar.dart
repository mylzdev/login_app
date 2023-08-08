import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/features/core/controllers/profile_controller.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';

import '../../../../../constants/text_strings.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return AppBar(
      leading: IconButton(
        onPressed: () {
          AuthenticationRepository.instance.logout();
        },
        color: Theme.of(context).iconTheme.color,
        icon: const Icon(
          Icons.menu,
        ),
      ),
      title: Text(tAppName, style: Theme.of(context).textTheme.headlineMedium),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        Obx(
          () => IconButton(
            onPressed: () {
              ProfileController.instance.isDarkMode.value =
                  !ProfileController.instance.isDarkMode.value;
            },
            icon: Icon(
              ProfileController.instance.isDarkMode.value || isDarkMode
                  ? LineAwesomeIcons.sun
                  : LineAwesomeIcons.moon,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
