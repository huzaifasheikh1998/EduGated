import 'package:edugated/features/selection/selection_navigator.dart';
import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'profile_initial_params.dart';
import 'profile_page.dart';

class ProfileNavigator with SelectionRoute {
  ProfileNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  final Navigation navigator;
}

mixin ProfileRoute {
  openProfile(ProfileInitialParams initialParams) {
    navigator.push(
      context,
      ProfilePage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
