import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';
import 'package:flutter_facebook_ui_responsive/data/data.dart';
import 'package:flutter_facebook_ui_responsive/models/models.dart';
import 'package:flutter_facebook_ui_responsive/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(),
          desktop: _HomeScreenDesktop(),
          tablet: SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        const SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.5),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.5),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  const _HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.orange,
          ),
        ),
        Container(
          color: Colors.red,
          width: 600.0,
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
