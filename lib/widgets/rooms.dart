import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';
import 'package:flutter_facebook_ui_responsive/models/models.dart';
import 'package:flutter_facebook_ui_responsive/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDestop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 5.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        color: Colors.white,
        height: 60.0,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _CreateRoomButton();
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvater(
                imagUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        print("create room");
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(width: 3.0, color: Colors.blueAccent),
        ),
        primary: Palette.facebookBlue,
      ),
      child: Row(
        children: const [
          // ShaderMask(
          //   shaderCallback: (rect) {
          //     return Palette.createRoomGradient.createShader(rect);
          //   },
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),

          SizedBox(width: 4.0),
          Text("Create\nRoom"),
        ],
      ),
    );
  }
}
