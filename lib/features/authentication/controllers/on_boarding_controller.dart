import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_bording.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        title: tOnBoardingTitle1,
        color: tOnBoardingPage1Color,
        counterText: tOnBoardingCounter1,
        image: tOnBoradingImage1,
        subtitle: tOnBoardingSubTitle1,
        height: 0.5,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        title: tOnBoardingTitle2,
        color: tOnBoardingPage2Color,
        counterText: tOnBoardingCounter2,
        image: tOnBoradingImage2,
        subtitle: tOnBoardingSubTitle2,
        height: 0.5,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        title: tOnBoardingTitle3,
        color: tOnBoardingPage3Color,
        counterText: tOnBoardingCounter3,
        image: tOnBoradingImage3,
        subtitle: tOnBoardingSubTitle3,
        height: 0.5,
      ),
    ),
  ];

  skip() => controller.jumpToPage(page: 2);

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
}
