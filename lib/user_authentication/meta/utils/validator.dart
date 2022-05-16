class FieldValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) return 'Enter Email!';
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';

    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter Valid Email!';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return 'Enter Password!';
    if (value.length < 7) return 'Password must be more than 6 character';
    return null;
  }
}
