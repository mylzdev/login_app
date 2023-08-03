import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/core/controllers/profile_controller.dart';

import '../../utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Obx(
      () => GetMaterialApp(
        title: 'Login',
        debugShowCheckedModeBanner: false,
        theme: controller.isDarkMode.value
            ? TAppTheme.lightTheme
            : TAppTheme.darkTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
