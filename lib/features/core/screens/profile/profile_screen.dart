import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/constants/colors.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/models/user_model.dart';
import 'package:login_app/features/core/controllers/profile_controller.dart';
import 'package:login_app/features/core/screens/profile/update_profile.dart';
import 'package:login_app/features/core/screens/profile/user_management.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel user = snapshot.data as UserModel;
                    return Column(
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
                          user.fullname,
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

                        /* -- Settings -- */

                        ProfileMenuWidget(
                          title: tMenu1,
                          leadingIcon: LineAwesomeIcons.cog,
                          onPress: () {},
                        ),

                        /* -- Billing Details -- */

                        ProfileMenuWidget(
                          title: tMenu2,
                          leadingIcon: LineAwesomeIcons.wallet,
                          onPress: () {},
                        ),

                        /* -- User Management -- */

                        ProfileMenuWidget(
                          title: tMenu3,
                          leadingIcon: LineAwesomeIcons.user_check,
                          onPress: () {
                            Get.to(() => const UserManagementScreen());
                          },
                        ),
                        const Divider(),
                        const SizedBox(height: 30),

                        /* -- Information -- */

                        ProfileMenuWidget(
                          title: tMenu4,
                          leadingIcon: LineAwesomeIcons.info,
                          onPress: () {},
                        ),

                        /* -- Log out -- */

                        ProfileMenuWidget(
                          title: tMenu5,
                          leadingIcon: LineAwesomeIcons.alternate_sign_out,
                          onPress: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                      'Are you sure you want to log out?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        AuthenticationRepository.instance
                                            .logout();
                                      },
                                      child: const Text(
                                        'Logout',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          textColor: Colors.red,
                          hasTrailingIcon: false,
                        ),
                      ],
                    );
                  } else {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
