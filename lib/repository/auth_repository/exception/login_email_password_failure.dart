class LoginWithEmailAndPasswordFailure {
  final String message;
  LoginWithEmailAndPasswordFailure([this.message = 'An unknown error occured.']);

  factory LoginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'user-not-found':
        return LoginWithEmailAndPasswordFailure('No user found for that email.');
      case 'wrong-password':
        return LoginWithEmailAndPasswordFailure(
            'Wrong password provided for that user.');
      case 'user-disabled':
        return LoginWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      default:
        return LoginWithEmailAndPasswordFailure();
    }
  }
}
