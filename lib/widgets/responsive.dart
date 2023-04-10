import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget tablet;
  final Widget mobile;
  final Widget desktop;
  const Responsive({
    super.key,
    required this.tablet,
    required this.mobile,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDestop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth >= 1200) {
          return desktop;
        } else if (constraint.maxWidth >= 800) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
