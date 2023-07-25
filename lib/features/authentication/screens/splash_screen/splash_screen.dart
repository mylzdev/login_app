import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/common_widgets/fade_in_animation/fadein_animation_controller.dart';
import 'package:login_app/common_widgets/fade_in_animation/fadein_animation_model.dart';
import 'package:login_app/constants/image_strings.dart';

import '../../../../common_widgets/fade_in_animation/animation_design.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const Curve curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 1500,
              animate: TAnimationPosition(
                topAfter: tDefaultSize,
                topBefore: 0,
                leftAfter: tDefaultSize,
                leftBefore: 0,
              ),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: tPrimaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            TFadeInAnimation(
              durationInMs: 1500,
              animate: TAnimationPosition(
                topBefore: 88,
                topAfter: 88,
                leftAfter: tDefaultSize,
                leftBefore: -30,
              ),
              child: Text(
                tAppName,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 21),
              ),
            ),
            TFadeInAnimation(
              durationInMs: 1500,
              animate: TAnimationPosition(
                topAfter: 120,
                topBefore: 120,
                leftAfter: tDefaultSize,
                leftBefore: -30,
              ),
              child: Text(
                tAppTagLine,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            TFadeInAnimation(
              durationInMs: 1500,
              animate: TAnimationPosition(
                bottomAfter: 70,
                bottomBefore: 0,
                leftAfter: 10,
                leftBefore: 10,
              ),
              child: Image.asset(
                tSplashScreen,
                height: mediaQuery.size.height * 0.6,
              ),
            ),
            TFadeInAnimation(
              durationInMs: 1500,
              animate: TAnimationPosition(
                bottomBefore: 0,
                bottomAfter: tDefaultSize,
                rightBefore: 0,
                rightAfter: tDefaultSize,
              ),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: tPrimaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
