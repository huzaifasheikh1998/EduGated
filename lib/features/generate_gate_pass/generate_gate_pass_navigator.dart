import 'package:edugated/features/add_contact/add_contact_navigator.dart';
import 'package:edugated/features/contact/contact_navigator.dart';
import 'package:edugated/features/guest_pass/guest_pass_navigator.dart';
import 'package:edugated/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'generate_gate_pass_initial_params.dart';
import 'generate_gate_pass_page.dart';

class GenerateGatePassNavigator with AddContactRoute, GuestPassRoute ,ContactRoute{
  GenerateGatePassNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  final Navigation navigator;
}

mixin GenerateGatePassRoute {
  openGenerateGatePass(GenerateGatePassInitialParams initialParams) {
    navigator.push(
      context,
      GenerateGatePassPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
