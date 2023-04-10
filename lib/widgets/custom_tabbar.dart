import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<IconData> icons;
  final Function onTap;
  final bool isBottomIndicator;
  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.icons,
    required this.onTap,
    this.isBottomIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isBottomIndicator
            ? const Border(
                bottom: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3.0,
                ),
              )
            : const Border(
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
