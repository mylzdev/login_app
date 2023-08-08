import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/core/controllers/dashboard_controller.dart';

import 'widget/appbar.dart';
import 'widget/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: const HomeAppbar(),
      body: Obx(
        () => controller.pages[controller.currentPageIndex.value],
      ),
      bottomNavigationBar:
          BottomNavBar(isDarkMode: isDarkMode, controller: controller),
    );
  }
}
