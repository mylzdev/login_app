import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            tEditProfile,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                /* -- Profile Picture -- */
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
                        child: IconButton(
                          iconSize: 20,
                          icon: const Icon(LineAwesomeIcons.camera),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50),

                /* -- Form -- */

                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: tFullName,
                            hintText: tFullName,
                            prefixIcon: Icon(LineAwesomeIcons.user)),
                      ),
                      const SizedBox(height: tFormHeight - 20),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: tEmail,
                            hintText: tEmail,
                            prefixIcon: Icon(LineAwesomeIcons.envelope)),
                      ),
                      const SizedBox(height: tFormHeight - 20),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: tPhoneNo,
                            hintText: tPhoneNo,
                            prefixIcon: Icon(LineAwesomeIcons.phone)),
                      ),
                      const SizedBox(height: tFormHeight - 20),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: tPassword,
                            hintText: tPassword,
                            prefixIcon: Icon(LineAwesomeIcons.lock)),
                      ),
                      const SizedBox(height: tFormHeight - 20),
                    ],
                  ),
                ),
                const SizedBox(height: tFormHeight),

                /* -- Edit Profile Button */

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const UpdateProfileScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: tPrimaryColor,
                        shape: const StadiumBorder()),
                    child: Text(
                      tEditProfile,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: tDarkColor),
                    ),
                  ),
                ),
                const SizedBox(height: tFormHeight + 10),

                /* -- Footer -- */

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: tJoined,
                        style: TextStyle(fontSize: 12),
                        children: [
                          TextSpan(
                            text: tJoinedAt,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                        elevation: 0,
                        side: BorderSide.none,
                        foregroundColor: Colors.red,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: const Text(tDelete),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
