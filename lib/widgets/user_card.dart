import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/data/data.dart';
import 'package:flutter_facebook_ui_responsive/models/models.dart';
import 'package:flutter_facebook_ui_responsive/widgets/profile_avater.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvater(imagUrl: user.imageUrl),
          const SizedBox(width: 6.0),
          Text(
            user.name,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
