import 'package:flutter/material.dart';
import 'package:login_app/features/core/controllers/profile_controller.dart';

import '../../../../../constants/colors.dart';
import '../../../models/top_courses_model.dart';

class TopCourses extends StatelessWidget {
  const TopCourses({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final topCoursesList = TopCoursesModel.list;
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: topCoursesList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: topCoursesList[index].onPress,
          child: SizedBox(
            width: 330,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      isDarkMode || !ProfileController.instance.isDarkMode.value
                          ? tCardDarkColor
                          : tCardLightColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            topCoursesList[index].title,
                            style: txtTheme.headlineMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          child: Image(
                            image: AssetImage(topCoursesList[index].image),
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder()),
                          onPressed: () {},
                          child: const Icon(Icons.play_arrow),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              topCoursesList[index].heading,
                              style: txtTheme.headlineMedium,
                            ),
                            Text(
                              topCoursesList[index].subHeading,
                              style: txtTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
