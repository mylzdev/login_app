import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/core/screens/dashboard/dashboard_screen.dart';
import 'package:login_app/features/core/screens/favorites/favorite_screen.dart';
import 'package:login_app/features/core/screens/profile/profile_screen.dart';

class HomeController extends GetxController {
  RxInt currentPageIndex = 0.obs;

  List<Widget> pages = [
    const DashboardScreen(),
    const FavoriteScreen(),
    const Scaffold(backgroundColor: Colors.amber),
    const ProfileScreen(),
  ];
}