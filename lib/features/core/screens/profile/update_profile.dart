import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/models/user_model.dart';
import 'package:login_app/features/core/controllers/profile_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import 'widgets/edit_profile_footer.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
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
          icon: Icon(
            LineAwesomeIcons.angle_left,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
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
              
                    final email = TextEditingController(text: user.email);
                    final password = TextEditingController(text: user.password);
                    final fullname = TextEditingController(text: user.fullname);
                    final phoneNo = TextEditingController(text: user.phoneNo);
              
                    return Column(
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
                                controller: fullname,
                                decoration: const InputDecoration(
                                    labelText: tFullName,
                                    hintText: tFullName,
                                    prefixIcon: Icon(LineAwesomeIcons.user)),
                              ),
                              const SizedBox(height: tFormHeight - 20),
                              TextFormField(
                                controller: email,
                                decoration: const InputDecoration(
                                    labelText: tEmail,
                                    hintText: tEmail,
                                    prefixIcon:
                                        Icon(LineAwesomeIcons.envelope)),
                              ),
                              const SizedBox(height: tFormHeight - 20),
                              TextFormField(
                                controller: phoneNo,
                                decoration: const InputDecoration(
                                    labelText: tPhoneNo,
                                    hintText: tPhoneNo,
                                    prefixIcon: Icon(LineAwesomeIcons.phone)),
                              ),
                              const SizedBox(height: tFormHeight - 20),
                              TextFormField(
                                controller: password,
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
                            onPressed: () async {
                              final userData = UserModel(
                                id: user.id,
                                email: email.text.trim(),
                                fullname: fullname.text.trim(),
                                password: password.text.trim(),
                                phoneNo: phoneNo.text.trim(),
                              );
                              await controller.updateRecord(userData);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: tPrimaryColor,
                                shape: const StadiumBorder(),
                                side: BorderSide.none),
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
                        const EditProfileFooter(),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    Get.printError(info: snapshot.error.toString());
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text('Something went wrong'));
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
