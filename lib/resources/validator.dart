class Validator {
  bool _isFullName(String name) {
    String r = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = RegExp(r);

    return !regExp.hasMatch(name);
  }

  bool _isEmail(String email) {
    String r =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(r);

    return !regExp.hasMatch(email);
  }

  bool _isPhone(String phone) {
    // String r = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    String r = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    RegExp regExp = RegExp(r);

    return !regExp.hasMatch(phone);
  }

  String? validate(String value, String type) {
    if (value == "") {
      return "Please enter $type";
    } else {
      return null;
    }
  }

  String? validateEmail(
    String value,
  ) {
    if (value == "") {
      return "Please enter email address";
    } else if (_isEmail(value)) {
      return "Please enter a valid email address";
    } else {
      return null;
    }
  }

  String? validatePhone(String value, String type) {
    if (value == "") {
      return "Please enter your $type number";
    } else if (_isPhone(value)) {
      return "Please enter a valid $type Number";
    } else if (value.length < 8) {
      return "$type Number length should be greater than 8 digits";
    } else if (value.length > 15) {
      return "$type Number length should be less than 15 digits";
    } else {
      return null;
    }
  }

  String? validateFullName(String value) {
    if (value.isEmpty) {
      return "Please enter your full name";
    } else if (_isFullName(value)) {
      return "Please enter a valid full name";
    } else {
      return null;
    }
  }
}
