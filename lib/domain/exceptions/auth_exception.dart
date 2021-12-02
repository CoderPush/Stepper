class AuthException with Exception {
  final String errorMessage;
  const AuthException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}
