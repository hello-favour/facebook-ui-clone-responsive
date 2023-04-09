import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget tablet;
  final Widget mobile;
  final Widget desktop;
  const Responsive(
      {super.key,
      required this.tablet,
      required this.mobile,
      required this.desktop});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
