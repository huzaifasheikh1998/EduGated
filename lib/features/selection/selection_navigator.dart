import 'package:edugated/features/login/login_navigator.dart';
import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'selection_initial_params.dart';
import 'selection_page.dart';

class SelectionNavigator with LoginRoute {
  SelectionNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  final Navigation navigator;
}

mixin SelectionRoute {
  openSelection(SelectionInitialParams initialParams) {
    navigator.push(
      context,
      SelectionPage(cubit: getIt(param1: initialParams)),
    );
  }

  backToSelection(SelectionInitialParams initialParams) {
    navigator.pushRemoveUntil(
      context,
      SelectionPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
