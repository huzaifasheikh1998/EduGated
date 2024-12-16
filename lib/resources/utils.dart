import 'dart:io';
import 'package:edugated/resources/app_assets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Utils {
  static String toLocalDateTime(String date, String time) {
    DateTime dd = DateFormat(
      'yyyy-MM-dd T HH:mm:ss Z',
    ).parse(date + " T " + time.split(".").first + " Z ");
    print(dd);

    return dd.toLocal().toString();
    // .toFormatDateTime(format: "DD-MM-yyyy hh:mm a");
    // String t = time.toFormatDateTime(format: "hh:mm a");
    // String d = date.toFormatDateTime(format: "DD-MM-yyyy");
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message, BuildContext context) {
    FToast toast = FToast();
    toast.init(context);
    toast.removeCustomToast();
    toast.showToast(
        child: Container(
      constraints: BoxConstraints(maxWidth: 0.8.sw),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade900, borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.logo,
            height: 25.h,
          ),
          10.horizontalSpace,
          Flexible(
            child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ));
  }

  static showSnack(String msg, BuildContext _context) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }

  static platform() {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else {
      return 'NotDefine';
    }
  }

  static showLoaderAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        });
  }

  static showLoading(BuildContext context) {
    return Container(
      height: 400,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }

  static bool isEmail(String email) {
    String r =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(r);

    return !regExp.hasMatch(email);
  }

  static bool isPhone(String phone) {
    // String r = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    String r = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    RegExp regExp = new RegExp(r);

    return !regExp.hasMatch(phone);
  }

  static bool validateEmail(TextEditingController value, BuildContext context) {
    if (value.text.isEmpty) {
      Utils.toastMessage("Please enter your email address", context);
      return false;
    } else if (Utils.isEmail(value.text)) {
      Utils.toastMessage("Please enter a valid email address", context);
      return false;
    } else {
      return true;
    }
  }

  static bool validatePhone(
      TextEditingController value, String type, BuildContext context) {
    if (value.text.isEmpty) {
      Utils.toastMessage("Please enter your $type number", context);
      return false;
    } else if (Utils.isPhone(value.text)) {
      Utils.toastMessage("Please enter a valid $type Number", context);
      return false;
    } else if (value.text.length < 8) {
      Utils.toastMessage(
          "$type Number length should be greater than 8 digits", context);
      return false;
    } else if (value.text.length > 15) {
      Utils.toastMessage(
          "$type Number length should be less than 15 digits", context);
      return false;
    } else {
      return true;
    }
  }

  static bool validatePassword(
      TextEditingController value, BuildContext context) {
    if (value.text.isEmpty) {
      Utils.toastMessage("Please enter your password", context);
      return false;
    } else if (value.text.length < 8) {
      Utils.toastMessage("Password should be greater than 8 digits", context);
      return false;
    } else if (value.text.length > 16) {
      Utils.toastMessage("Password length should be less than 16", context);
      return false;
    } else {
      return true;
    }
  }

  static bool validateNewPassword(
      TextEditingController value, BuildContext context) {
    if (value.text.isEmpty) {
      Utils.toastMessage("Enter your New password", context);
      return false;
    } else if (value.text.length < 8) {
      Utils.toastMessage("Password should be greater than 8 digits", context);
      return false;
    } else if (value.text.length > 16) {
      Utils.toastMessage("Password length should be less than 16", context);
      return false;
    } else {
      return true;
    }
  }

  static bool validateExistingPassword(
      TextEditingController value, BuildContext context) {
    if (value.text.isEmpty) {
      Utils.toastMessage("Please enter your password", context);
      return false;
    } else if (value.text.length < 8) {
      Utils.toastMessage("Current password is incorrect", context);
      return false;
    } else if (value.text.length > 16) {
      Utils.toastMessage("Current password is incorrect", context);
      return false;
    } else {
      return true;
    }
  }

  static bool validateConfirmPassword(TextEditingController value1,
      TextEditingController value2, BuildContext context) {
    if (value2.text.isEmpty) {
      Utils.toastMessage("Please enter Confirm Password", context);
      return false;
    } else if (value1.text != value2.text) {
      Utils.toastMessage("Password does not match", context);
      return false;
    } else {
      return true;
    }
  }

  static bool validate(
      TextEditingController value, String type, BuildContext context) {
    if (value.text.isEmpty) {
      Utils.toastMessage("Please enter your $type", context);
      return false;
    } else {
      return true;
    }
  }

  static bool isFullName(String name) {
    String r = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(r);

    return !regExp.hasMatch(name);
  }

  static bool validateFullName(
      TextEditingController value, BuildContext context) {
    if (value.text.isEmpty) {
      Utils.toastMessage("Please enter your full name", context);
      return false;
    } else if (isFullName(value.text)) {
      Utils.toastMessage("Please enter a valid full name", context);
      return false;
    } else {
      return true;
    }
  }

  static bool validateBirthDay(DateTime? dateTime, BuildContext context) {
    if (dateTime == null) {
      Utils.toastMessage("Please select Date of Birth", context);

      return false;
    } else if (dateTime.add(Duration(days: 365 * 18)).isAfter(DateTime.now())) {
      Utils.toastMessage("You should be at least 18 year old", context);
      return false;
    } else {
      return true;
    }
  }

  // static String formattedTime({required int timeInSecond}) {
  //   int sec = timeInSecond % 60;
  //   int min = (timeInSecond / 60).floor();
  //   String minute = min.toString().length <= 1 ? "0$min" : "$min";
  //   String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  //   return "$minute : $second";
  // }

  static String formattedTime({required int timeInSecond}) {
    int hours = (timeInSecond / 3600).floor();
    int remainingSeconds = timeInSecond % 3600;
    int minutes = (remainingSeconds / 60).floor();
    int seconds = remainingSeconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return hours != 0
        ? "$hoursStr:$minutesStr:$secondsStr"
        : "$minutesStr:$secondsStr";
  }

  static double distanceInMile(int? distanceInMeter) {
    if (distanceInMeter == null) {
      return 0;
    } else {
      return distanceInMeter / 1609.344;
    }
  }

  // static double distanceInMile(String distance) {
  //   double distanceInDouble = 0.0;
  //   distance = distance.trim();

  //   if (distance.contains("mile")) {
  //     distanceInDouble = double.parse(distance.split(' ').first);
  //   } else if (distance.contains("km")) {
  //     distanceInDouble = double.parse(distance.split(' ').first) / 1.609344;
  //   } else if (distance.contains("m")) {
  //     distanceInDouble = double.parse(distance.split(' ').first) / 1609.344;
  //   }
  //   //// log("<<<<<<<<<<<<<<<dist#$distanceInDouble>>>>>>>>>of#$distance>>>>>>");
  //   return distanceInDouble;
  // }

  static double timeInMin(String time) {
    double timeInDouble = 0.0;
    time = time.trim();

    if (time.contains("mins")) {
      timeInDouble = double.parse(time.split(' ').first);
    } else if (time.contains("secs")) {
      timeInDouble = double.parse(time.split(' ').first) * 0.0166667;
    } else if (time.contains("hours")) {
      timeInDouble = double.parse(time.split(' ').first) * 60;
    }
    //// log("<<<<<<<<<<<<<<<time#$timeInDouble>>>>>>>>>of#$time>>>>>>");

    return timeInDouble;
  }

  static closeKeyBoard(context) {
    FocusScope.of(context).unfocus();
  }

  // static Future<void> saveToLocal(
  //     {required String key, required String value}) async {
  //   final FlutterSecureStorage storage = FlutterSecureStorage();
  //   await storage.write(key: key, value: value);
  // }

  // static Future<String> getFromLocal({required String key}) async {
  //   final FlutterSecureStorage storage = FlutterSecureStorage();
  //   return await storage.read(
  //         key: key,
  //       ) ??
  //       '';
  // }
}
