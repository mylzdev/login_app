import 'package:flutter/material.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';

import 'widgets/appbar.dart';
import 'widgets/banners.dart';
import 'widgets/categories.dart';
import 'widgets/searchbox.dart';
import 'widgets/top_courses.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DashboardAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* -- Heading -- */
              Text(tDashboardTitle, style: txtTheme.bodyMedium),
              Text(tDashboardHeading, style: txtTheme.displayMedium),
              const SizedBox(height: tDashboardHeight),
              /* -- Searchbar -- */
              DashboardSearchbox(txtTheme: txtTheme),
              const SizedBox(height: tDashboardHeight),
              /* -- Categories -- */
              DashboardCategories(txtTheme: txtTheme),
              const SizedBox(height: tDashboardHeight),
              /* -- Banners -- */
              DashboardBanners(txtTheme: txtTheme),
              const SizedBox(height: tDashboardHeight),
              /* -- Top Courses */
              Text(
                tDashboardTopCourses,
                style: txtTheme.headlineMedium?.apply(fontSizeFactor: 1.2),
              ),
              const SizedBox(height: tDashboardHeight - 10),
              TopCourses(txtTheme: txtTheme)
            ],
          ),
        ),
      ),
    );
  }
}