// ignore_for_file: file_names, unused_element

import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final IconData icon;
  final Widget right;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.icon,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Icon(
              icon,
              color: Colors.grey[600],
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 60,
            width: 60,
            child: right,
          ),
        ],
      ),
    );
  }
}
