import 'package:flutter/material.dart';
import 'package:login_app/constants/image_strings.dart';

class TopCoursesModel {
  final String title;
  final String heading;
  final String subHeading;
  final String image;
  final VoidCallback? onPress;

  TopCoursesModel(this.title, this.heading, this.subHeading, this.image, this.onPress);

  static List<TopCoursesModel> list = [
    TopCoursesModel('Flutter Crash Course', '3 Sections', 'Programming Language', tOnBoradingImage1, null),
    TopCoursesModel('HTML/CSS Crash Course', '2 Sections', 'Web Development', tOnBoradingImage2, null),
    TopCoursesModel('Unity Crash Course', '5 Sections', 'Game Development', tOnBoradingImage3, null),
  ];
}