import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/core/controllers/profile_controller.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: !ProfileController.instance.isDarkMode.value || isDarkMode
                  ? tCardDarkColor
                  : tCardLightColor,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Icon(Icons.bookmark_border_outlined)),
                    Flexible(
                        child: Image(
                      image: AssetImage(tOnBoradingImage2),
                      height: 45,
                    ))
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  tDashboardBannerTitle1,
                  style: txtTheme.headlineMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  tDashboardBannerSubtitle,
                  style: txtTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: tDashboardHeight),
        Expanded(
          child: Column(
            children: [
              Obx(
                () => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: !ProfileController.instance.isDarkMode.value || isDarkMode
                        ? tCardDarkColor
                        : tCardLightColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Icon(Icons.bookmark_border_outlined)),
                          Flexible(
                              child: Image(
                            image: AssetImage(tOnBoradingImage2),
                            height: 45,
                          ))
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text(
                        tDashboardBannerTitle2,
                        style: txtTheme.headlineMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        tDashboardBannerSubtitle,
                        style: txtTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(tDashboardButton),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
