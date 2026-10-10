import 'package:flutter/material.dart';

abstract final class Breakpoints {
  static const desktop = 960.0;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktop;
}
