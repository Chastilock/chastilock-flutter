class EmailHelpers {
  static bool isEmailValid(String email) {
    bool emailValid =
        RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)")
            .hasMatch(email);
    return emailValid;
  }
}
