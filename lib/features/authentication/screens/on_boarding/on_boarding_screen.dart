import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:login_app/constants/colors.dart';
import 'package:get/get.dart';
import 'package:login_app/features/authentication/controllers/on_boarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            enableLoop: false,
            enableSideReveal: true,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangedCallback,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          Positioned(
            bottom: 80.0,
            child: OutlinedButton(
              onPressed: () => obController.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                    color: tDarkColor, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 15,
            child: TextButton(
              onPressed: () => obController.skip(),
              style: ButtonStyle(
                  overlayColor:
                      MaterialStatePropertyAll(Colors.white.withOpacity(0.7))),
              child: const Text("Skip", style: TextStyle(color: Colors.grey)),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 30,
              child: AnimatedSmoothIndicator(
                count: 3,
                activeIndex: obController.currentPage.value,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
