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
        title: Text('Post Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/sample_image.jpeg'),
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
