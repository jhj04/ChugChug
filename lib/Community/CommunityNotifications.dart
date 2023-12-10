import 'dart:ui';

import 'package:flutter/material.dart';

class CommunityNotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false, // Left-align the title
        title: Row(
          children: [
            Image.asset(
              'assets/chugchug.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            SizedBox(width: 8), // Add spacing between image and text
            Text(
              'Community',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Fraunces",
                fontVariations: <FontVariation>[FontVariation('wght', 700.0)],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('테스트 알림 1'),
            subtitle: Text('From: 조원재'),
            // Handle tapping on the notification if needed
          ),
          ListTile(
            title: Text('테스트 알림 2'),
            subtitle: Text('From: 정현주'),
            // Handle tapping on the notification if needed
          ),
          // Add more notifications as needed
        ],
      ),
    );
  }
}
