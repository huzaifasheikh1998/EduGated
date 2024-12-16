import 'package:edugated/features/scan/scan_navigator.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'package:edugated/features/gate_pass/gate_pass_navigator.dart';
import 'package:flutter/material.dart';
import 'activity_initial_params.dart';
import 'activity_page.dart';

class ActivityNavigator with GatePassRoute,ScanRoute {
  ActivityNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  final Navigation navigator;
}

mixin ActivityRoute {
  openActivityRoute(ActivityInitialParams initialParams) {
    navigator.push(
      context,
      ActivityPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
