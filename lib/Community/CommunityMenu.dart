import 'dart:ui';

import 'package:flutter/material.dart';

class CommunityMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/ChugChug_Typo.png',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMenuItem(Icons.announcement, '공지사항'),
            buildMenuItem(Icons.settings, '설정'),
            buildMenuItem(Icons.policy, '개인정보 처리방침'), // Replace 'policy' with the actual icon you want
            // Add more items as needed
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String text) {
    return InkWell(
      onTap: () {
        // Handle item tap
        print('$text tapped');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Icon(icon, size: 30),
            SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
