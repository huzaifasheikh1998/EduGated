import 'package:flutter/material.dart';

abstract class Navigation {
  push(BuildContext context, Widget page);
  pushReplacement(BuildContext context, Widget page);
  pushRemoveUntil(BuildContext context,Widget page);
}
