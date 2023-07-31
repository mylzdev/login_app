import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/constants/colors.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/core/screens/profile/update_profile.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              LineAwesomeIcons.angle_left,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          title: Text(tProfile, style: txtTheme.headlineMedium),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                isDarkMode ? LineAwesomeIcons.moon : LineAwesomeIcons.sun,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                /* -- Profile Picture */

                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(tProfileImage),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: tPrimaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                /* -- Username */

                Text(
                  tProfileHeading,
                  style: txtTheme.headlineMedium,
                ),
                Text(
                  tProfileSubHeading,
                  style: txtTheme.bodyMedium,
                ),
                const SizedBox(height: 20),

                /* -- Edit Profile Button */

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const UpdateProfileScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      tEditProfile,
                      style: txtTheme.titleLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(),

                /* -- Menu -- */

                ProfileMenuWidget(
                  title: tMenu1,
                  leadingIcon: LineAwesomeIcons.cog,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: tMenu2,
                  leadingIcon: LineAwesomeIcons.wallet,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: tMenu3,
                  leadingIcon: LineAwesomeIcons.user_check,
                  onPress: () {},
                ),
                const Divider(),
                const SizedBox(height: 30),
                ProfileMenuWidget(
                  title: tMenu4,
                  leadingIcon: LineAwesomeIcons.info,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: tMenu5,
                  leadingIcon: LineAwesomeIcons.alternate_sign_out,
                  onPress: () {
                    AuthenticationRepository.instance.logout();
                  },
                  textColor: Colors.red,
                  hasTrailingIcon: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
