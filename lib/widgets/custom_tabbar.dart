import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<IconData> icons;
  final Function onTap;
  const CustomTabBar(
      {super.key,
      required this.selectedIndex,
      required this.icons,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                    size: 30.0,
                  ),
                ),
              ))
          .values
          .toList(),
    );
  }
}
