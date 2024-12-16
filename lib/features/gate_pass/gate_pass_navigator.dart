import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'gate_pass_initial_params.dart';
import 'gate_pass_page.dart';

class GatePassNavigator {}

mixin GatePassRoute {
  openGatePass(GatePassInitialParams initialParams) {
    navigator.push(
      context,
      GatePassPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
