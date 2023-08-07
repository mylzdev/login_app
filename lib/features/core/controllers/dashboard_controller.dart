import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/core/screens/dashboard/dashboard_screen.dart';

class DashboardController extends GetxController {
  RxInt currentPageIndex = 0.obs;

  List<Widget> pages = [
    const DashboardScreen(),
    const Scaffold(backgroundColor: Colors.red),
    const Scaffold(backgroundColor: Colors.amber),
    const Scaffold(backgroundColor: Colors.blue),
  ];
}