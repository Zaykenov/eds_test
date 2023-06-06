import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final String email;
  final String username;
  final String comment;

  const CommentCard({
    required this.email,
    required this.username,
    required this.comment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF243b55),
          width: 3,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            style: ListTileStyle.list,
            title: Text(username),
            subtitle: Text(email),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(comment),
          )
        ],
      ),
    );
  }
}
