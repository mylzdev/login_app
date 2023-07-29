import 'package:flutter/material.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';

import '../../../../../constants/text_strings.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.menu,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(tAppName, style: Theme.of(context).textTheme.headlineMedium),
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 7, right: 10),
          child: IconButton(
            color: Theme.of(context).iconTheme.color,
            icon: const Icon(
              Icons.person,
            ),
            onPressed: () {
              AuthenticationRepository.instance.logout();
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
