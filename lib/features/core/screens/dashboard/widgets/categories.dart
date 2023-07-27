import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../models/categories_model.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final categorieslist = DashboardCategoriesModel.list;

    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: categorieslist.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: categorieslist[index].onPress,
          child: SizedBox(
            height: 50,
            width: 170,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: tDarkColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      categorieslist[index].title,
                      style: txtTheme.titleLarge?.apply(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categorieslist[index].heading,
                        style: txtTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        categorieslist[index].subHeading,
                        style: txtTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
