import 'package:get/get.dart';
import 'package:login_app/features/authentication/models/user_model.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';
import 'package:login_app/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find(); 

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // Get User email and pass to UserRepository to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }
}