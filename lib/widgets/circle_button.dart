import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Widget icon;
  final double iconSize;
  final VoidCallback onPressed;
  const CircleButton(
      {super.key,
      required this.icon,
      required this.iconSize,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        iconSize: iconSize,
        color: Colors.black,
      ),
    );
  }
}
