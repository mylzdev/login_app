import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/constants/colors.dart';
import 'package:login_app/features/core/controllers/dashboard_controller.dart';
import 'package:login_app/features/core/controllers/profile_controller.dart';

import 'widget/appbar.dart';
import 'widget/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(DashboardController());

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
