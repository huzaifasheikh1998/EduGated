import 'package:edugated/features/home/home_navigator.dart';
import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'login_initial_params.dart';
import 'login_page.dart';

class LoginNavigator with HomeRoute {
  LoginNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  final Navigation navigator;
}

mixin LoginRoute {
  openLogin(LoginInitialParams initialParams) {
    navigator.push(
      context,
      LoginPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
