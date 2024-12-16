import 'package:edugated/features/gate_pass/gate_pass_navigator.dart';
import 'package:edugated/features/generate_gate_pass/generate_gate_pass_navigator.dart';
import 'package:edugated/features/guest_pass/guest_pass_navigator.dart';
import 'package:edugated/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'guest_initial_params.dart';
import 'guest_page.dart';

class GuestNavigator with GenerateGatePassRoute, GuestPassRoute {
  GuestNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  final Navigation navigator;
}

mixin GuestRoute {
  openGuest(GuestInitialParams initialParams) {
    navigator.push(
      context,
      GuestPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
