import 'package:get/get.dart';
import 'package:login_app/features/authentication/models/user_model.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';
import 'package:login_app/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // Variable
  RxBool isDarkMode = false.obs;

  // Get User email and pass to UserRepository to fetch user record
  getUserData() async {
    final email = _authRepo.firebaseUser.value!.email;
    if (email != null) {
      return await _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
      Get.printError(info: 'Error');
    }
  }

  Future<List<UserModel>> getAllUser() async => await _userRepo.allUser();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
