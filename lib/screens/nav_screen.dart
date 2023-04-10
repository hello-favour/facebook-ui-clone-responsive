import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/data/data.dart';
import 'package:flutter_facebook_ui_responsive/screens/home_screen.dart';
import 'package:flutter_facebook_ui_responsive/widgets/custom_app_bar.dart';
import 'package:flutter_facebook_ui_responsive/widgets/custom_tabbar.dart';
import 'package:flutter_facebook_ui_responsive/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCancelOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDestop(context)
            ? PreferredSize(
                child: CustomAppBar(
                    currentUser: currentUser,
                    icons: _icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }),
                preferredSize: Size(screenSize.width, 100.0),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDestop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
