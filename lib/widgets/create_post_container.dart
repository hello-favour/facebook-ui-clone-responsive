import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/models/user_model.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.orange,
    );
  }
}
