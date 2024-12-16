import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'home_initial_params.dart';
import 'home_page.dart';

class HomeNavigator {}

mixin HomeRoute {
  openHome(HomeInitialParams initialParams) {
    navigator.pushReplacement(
      context,
      HomePage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
