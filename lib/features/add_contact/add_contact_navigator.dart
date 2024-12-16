import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'add_contact_initial_params.dart';
import 'add_contact_page.dart';

class AddContactNavigator {}

mixin AddContactRoute {
  openAddContact(AddContactInitialParams initialParams) {
    navigator.push(
      context,
      AddContactPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
