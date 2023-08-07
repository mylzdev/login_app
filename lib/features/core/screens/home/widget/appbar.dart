import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';

import '../../../../../constants/text_strings.dart';
import '../../profile/profile_screen.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        Container(
          margin: const EdgeInsets.only(top: 7, right: 10),
          child: IconButton(
            color: Theme.of(context).iconTheme.color,
            icon: const Icon(
              Icons.person,
            ),
            onPressed: () {
              Get.to(() => const ProfileScreen());
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
