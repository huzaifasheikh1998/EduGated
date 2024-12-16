import 'package:edugated/features/pass_detail/pass_detail_navigator.dart';
import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'scan_initial_params.dart';
import 'scan_page.dart';

class ScanNavigator with PassDetailRoute {
  ScanNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  final Navigation navigator;
}

mixin ScanRoute {
  openScan(ScanInitialParams initialParams) {
    navigator.push(
      context,
      ScanPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
