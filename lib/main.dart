import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';
import 'package:flutter_facebook_ui_responsive/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Facebook UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Palette.scaffold,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
