import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_app/exceptions/auth_exception/auth_exception.dart';
import 'package:login_app/features/authentication/models/user_model.dart';
import 'package:login_app/features/authentication/screens/login/login_screen.dart';
import 'package:login_app/features/authentication/screens/mail_verification/mail_verification.dart';
import 'package:login_app/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:login_app/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login_app/features/core/screens/home/home_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  final verificationId = ''.obs;

  // Getters
  // User? get firebaseUser => _firebaseUser.value;

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
        ? Get.offAll(() => const OnBoardingScreen())
        : user.emailVerified
            ? Get.offAll(() => const HomeScreen())
            : Get.offAll(() => const MailVerificationScreen());
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = TAuthException(e.code);
      throw ex.message;
    } catch (_) {
      final ex = TAuthException();
      throw ex.message;
    }
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

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const HomeScreen())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = TAuthException.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      final ex = TAuthException();
      throw ex.message;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = TAuthException.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      final ex = TAuthException();
      throw ex.message;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = TAuthException.fromCode(e.code);
      throw ex;
    } catch (_) {
      final ex = TAuthException();
      throw ex.message;
    }
  }

  Future<void> sendPasswordResetCode(String email) async {
    try {
      List<String> emailExists = await _auth.fetchSignInMethodsForEmail(email);
      if (emailExists.isNotEmpty) {
        await _auth.sendPasswordResetEmail(email: email);
      } else {
        throw 'Invalid Email';
      }
    } on FirebaseAuthException catch (e) {
      Get.printError(info: e.code);
      final ex = TAuthException.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      throw 'Invalid Email';
    }
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = TAuthException.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      throw 'Something went wrong';
    }
  }

  Future<void> reAuthUser(UserModel user) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: user.email.trim(),
        password: user.password.trim(),
      );
      await _auth.currentUser?.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = TAuthException.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      final ex = TAuthException();
      throw ex;
    }
  }

  Future<void> deleteUserAccount() async {
    try {
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      Get.printError(info: e.toString());
      final ex = TAuthException.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      final ex = TAuthException();
      throw ex.message;
    }
  }
}
