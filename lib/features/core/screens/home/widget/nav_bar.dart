import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/colors.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../controllers/profile_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.isDarkMode,
    required this.controller,
  });

  final bool isDarkMode;
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: isDarkMode || ProfileController.instance.isDarkMode.value
              ? tCardLightColor
              : tCardDarkColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.3),
            )
          ]),
      child: Obx(
        () => GNav(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          tabBackgroundColor: tPrimaryColor,
          hoverColor: tPrimaryColor,
          selectedIndex: controller.currentPageIndex.value,
          onTabChange: (index) {
            controller.currentPageIndex.value = index;
          },
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          gap: 8.0,
          tabs: const [
            GButton(
              icon: LineAwesomeIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: LineAwesomeIcons.heart,
              text: 'Favorites',
            ),
            GButton(
              icon: LineAwesomeIcons.search,
              text: 'Search',
            ),
            GButton(
              icon: LineAwesomeIcons.user,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}