import 'dart:ui';

import 'package:chugchug/Community/CommunityMenu.dart';
import 'package:chugchug/Community/CommunityNotifications.dart';
import 'package:chugchug/Community/PostSearchPage.dart';
import 'package:chugchug/Widgets/Bar_Widgets.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  final String username;
  final String postDateTime;
  final String postTitle;
  final String postImageUrl;
  final String postBodyText;

  PostDetailPage({
    required this.username,
    required this.postImageUrl,
    required this.postTitle,
    required this.postDateTime,
    required this.postBodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Top_Logos("Community", 16),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostSearchPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommunityNotificationsPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommunityMenuPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/sample_image.jpeg'),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      postDateTime,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.0,
            indent: 16,
            endIndent: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              postTitle, // body의 제목 수정
              style: TextStyle(
                fontSize: 20, // 글씨 크기 수정
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset(
            postImageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              postBodyText,
              style: TextStyle(fontSize: 16),
            ),
          ),
          // 다른 필요한 정보 추가
        ],
      ),
    );
  }
}
