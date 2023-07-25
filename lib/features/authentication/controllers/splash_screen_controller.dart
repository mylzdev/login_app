import 'package:get/get.dart';
import 'package:login_app/features/authentication/screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool isAnimate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    isAnimate.value = true;
    await Future.delayed(const Duration(milliseconds: 4000));
    Get.to(() => const WelcomeScreen());
  }
}
