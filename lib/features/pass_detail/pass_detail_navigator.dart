import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'pass_detail_initial_params.dart';
import 'pass_detail_page.dart';

class PassDetailNavigator {}

mixin PassDetailRoute {
  openPassDetail(PassDetailInitialParams initialParams) {
    navigator.pushReplacement(
      context,
      PassDetailPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
