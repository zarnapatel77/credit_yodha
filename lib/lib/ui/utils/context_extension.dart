import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  Orientation get orientation => MediaQuery.of(this).orientation;

  void get hideKeyboard => FocusScope.of(this).unfocus();

  void get nextField => FocusScope.of(this).nextFocus();
}
