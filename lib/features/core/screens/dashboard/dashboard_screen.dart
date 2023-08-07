import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import 'widgets/banners.dart';
import 'widgets/categories.dart';
import 'widgets/searchbox.dart';
import 'widgets/top_courses.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* -- Heading -- */
              Text(tDashboardTitle, style: Theme.of(context).textTheme.bodyMedium),
              Text(tDashboardHeading, style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: tDashboardHeight),
              /* -- Searchbar -- */
              DashboardSearchbox(txtTheme: Theme.of(context).textTheme),
              const SizedBox(height: tDashboardHeight),
              /* -- Categories -- */
              DashboardCategories(txtTheme: Theme.of(context).textTheme),
              const SizedBox(height: tDashboardHeight),
              /* -- Banners -- */
              DashboardBanners(txtTheme: Theme.of(context).textTheme),
              const SizedBox(height: tDashboardHeight - 10),
              /* -- Top Courses */
              Text(
                tDashboardTopCourses,
                style: Theme.of(context).textTheme.headlineMedium?.apply(fontSizeFactor: 1.2),
              ),
              const SizedBox(height: tDashboardHeight - 10),
              TopCourses(txtTheme: Theme.of(context).textTheme)
            ],
          ),
        ),
      ),
    );
  }
}