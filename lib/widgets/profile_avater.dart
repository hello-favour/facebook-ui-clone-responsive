import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';

class ProfileAvater extends StatelessWidget {
  final String imagUrl;
  final bool isActive;
  const ProfileAvater(
      {super.key, required this.imagUrl, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[200],
          // backgroundImage: CachedNetworkImageProvider(imagUrl),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 14.0,
                  width: 14.0,
                  decoration: BoxDecoration(
                    color: Palette.online,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
