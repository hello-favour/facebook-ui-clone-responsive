import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';
import 'package:flutter_facebook_ui_responsive/models/models.dart';
import 'package:flutter_facebook_ui_responsive/widgets/circle_button.dart';
import 'package:flutter_facebook_ui_responsive/widgets/custom_tabbar.dart';
import 'package:flutter_facebook_ui_responsive/widgets/user_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final int selectedIndex;
  final List<IconData> icons;
  final User currentUser;
  final Function onTap;
  const CustomAppBar({
    super.key,
    required this.selectedIndex,
    required this.icons,
    required this.currentUser,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: const BoxDecoration(
        color: Colors.black12,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            offset: Offset(0, 2),
            color: Colors.black12,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            width: 600.0,
            height: double.infinity,
            child: CustomTabBar(
              selectedIndex: selectedIndex,
              icons: icons,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                const SizedBox(height: 12.0),
                CircleButton(
                  icon: const Icon(Icons.search),
                  iconSize: 30.0,
                  onPressed: () {
                    print("Search");
                  },
                ),
                CircleButton(
                  icon: const Icon(MdiIcons.facebookMessenger),
                  iconSize: 30.0,
                  onPressed: () {
                    print("Messenger");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
