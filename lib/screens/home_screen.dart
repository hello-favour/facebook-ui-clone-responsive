import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';
import 'package:flutter_facebook_ui_responsive/data/data.dart';
import 'package:flutter_facebook_ui_responsive/models/models.dart';
import 'package:flutter_facebook_ui_responsive/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
          tablet: SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenMobile({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
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
  final TrackingScrollController scrollController;
  const _HomeScreenDesktop({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: MoreOptionList(currentUser: currentUser),
            ),
          ),
        ),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
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
          ),
        ),
        const Spacer(),
        const Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: ContactList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
