import 'package:get/get.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/models/user_model.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';
import 'package:login_app/repository/user_repository/user_repository.dart';
import 'package:login_app/utils/auth_function/helper.dart';

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

  deleteUserDetails(UserModel user) async {
    try {
      await _authRepo.deleteUserAccount();
      await _userRepo.deleteUserFromDatabase(user.id!);
    } catch (e) {
      Helper.errorSnackbar(title: tOhSnap, message: e.toString());
    }
  }

  deleteUserAccount(UserModel user) async {
    try {
      await _authRepo.reAuthUser(user).then(
            (value) => deleteUserDetails(user),
          );
      _authRepo.logout();
    } catch (e) {
      Helper.errorSnackbar(title: tOhSnap, message: e.toString());
    }
  }
}
