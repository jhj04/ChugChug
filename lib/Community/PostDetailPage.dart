import 'dart:ui';

import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  final String username;
  final String postCaption;
  final String postImageUrl;

  // You can pass more data as needed for detailed information

  PostDetailPage({
    required this.username,
    required this.postCaption,
    required this.postImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/chugchug_character.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              username,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset(
            postImageUrl, // Replace with your post image
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              postCaption,
              style: TextStyle(fontSize: 16),
            ),
          ),
          // Add more details as needed
        ],
      ),
    );
  }
}
