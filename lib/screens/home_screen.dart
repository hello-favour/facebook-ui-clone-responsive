import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';
import 'package:flutter_facebook_ui_responsive/widgets/circle_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            title: const Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            floating: true,
            actions: [
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
        ],
      ),
    );
  }
}
