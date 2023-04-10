import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';
import 'package:flutter_facebook_ui_responsive/models/models.dart';
import 'package:flutter_facebook_ui_responsive/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionList extends StatefulWidget {
  final User currentUser;
  const MoreOptionList({super.key, required this.currentUser});

  @override
  State<MoreOptionList> createState() => _MoreOptionListState();
}

class _MoreOptionListState extends State<MoreOptionList> {
  final List<List> moreOptionList = [
    [MdiIcons.shieldAccount, Colors.deepPurple, "COVID-19 INFO CENTER"],
    [MdiIcons.accountMultiple, Colors.cyan, "Friends"],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, "Messenger"],
    [MdiIcons.flag, Colors.orange, "Pages"],
    [MdiIcons.storefront, Palette.facebookBlue, "Market place"],
    [Icons.ondemand_video, Palette.facebookBlue, "Watch"],
    [MdiIcons.calendarStar, Colors.red, "Events"],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemCount: 1 + moreOptionList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(user: widget.currentUser),
            );
          }
          final List option = moreOptionList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _Option(
              color: option[0],
              icon: option[1],
              label: option[2],
            ),
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final Color color;
  final String label;
  final IconData icon;
  const _Option(
      {super.key,
      required this.color,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(
            icon,
            size: 38.0,
            color: color,
          ),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
