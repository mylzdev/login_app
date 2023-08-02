import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/exceptions/auth_exception/auth_exception.dart';
import 'package:login_app/features/authentication/screens/login/login_screen.dart';
import 'package:login_app/features/authentication/screens/mail_verification/mail_verification.dart';
import 'package:login_app/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login_app/features/core/screens/dashboard/dashboard_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    FlutterNativeSplash.remove();
    setInitialScreen(firebaseUser.value);
    // ever(firebaseUser, _setInitialScreen);
  }

  setInitialScreen(User? user) async {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : user.emailVerified
            ? Get.offAll(() => const DashboardScreen())
            : Get.offAll(() => const MailVerificationScreen());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is invalid.');
        } else {
          Get.snackbar('Error', 'Something went wrong. Try again.');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
          verificationId: verificationId.value, smsCode: otp),
    );
    return credentials.user != null ? true : false;
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const DashboardScreen())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = TAuthException.fromCode(e.code);
      return ex.message;
    } catch (_) {
      final ex = TAuthException();
      return ex.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = TAuthException.fromCode(e.code);
      return ex.message;
    } catch (_) {
      final ex = TAuthException();
      return ex.message;
    }
    return null;
  }

  Future<String?> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = TAuthException.fromCode(e.code);
      throw ex;
    } catch (_) {
      final ex = TAuthException();
      throw ex.message;
    }
    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAll(() => const LoginScreen());
  }
}
