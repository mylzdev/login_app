class TAuthException implements Exception {
  final String message;

  TAuthException([this.message = "An unknown exception occured"]);

  factory TAuthException.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return TAuthException('Email is already in used');
      case 'invalid-email':
        return TAuthException('Email is not valid or badly formatted');
      case 'weak-password':
        return TAuthException('Please enter a stronger password');
      case 'user-disabled':
        return TAuthException('This is user has be disabled. Please contact support for help');
      case 'user-not-found':
        return TAuthException('Invalid details. Please create an account');
      case 'wrong-password':
        return TAuthException('Incorrect password. Please try again');
      case 'too-many-request':
        return TAuthException('Too many request. Service temporarily blocked');
      case 'invalid-argument':
        return TAuthException('An invalid agument was provided to an Authentication method');
      case 'invalid-password':
        return TAuthException('Incorrect password. Please try again');
      case 'invalid-phone-number':
        return TAuthException('The provided phone number is invalid');
      case 'operation-not-found':
        return TAuthException('The provided sign-in provided is disable for your Firebase project');
      case 'session-cookie-expired':
        return TAuthException('The provided Firebase session cookie is expired');
      case 'uid-already-exist':
        return TAuthException('The provided uid is already exist');
      default:
        return TAuthException();
    }
  }
}
