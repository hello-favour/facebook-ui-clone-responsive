import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/models/models.dart';
import 'package:flutter_facebook_ui_responsive/widgets/widgets.dart';

class ContactList extends StatelessWidget {
  final List<User> users;
  const ContactList({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Contacts",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 8.0),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemBuilder: (context, index) {
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(user: user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
