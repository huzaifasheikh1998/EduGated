import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'contact_initial_params.dart';
import 'contact_page.dart';

class ContactNavigator {}

mixin ContactRoute {
openContact(ContactInitialParams initialParams) {
navigator.push(
context,
ContactPage(cubit: getIt(param1: initialParams)),
);
}

Navigation get navigator;

BuildContext get context;
}
