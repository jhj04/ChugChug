import 'dart:ui';

import 'package:chugchug/Community/CommunityMenu.dart';
import 'package:chugchug/Community/CommunityNotifications.dart';
import 'package:chugchug/Community/PostAddPage.dart';
import 'package:chugchug/Community/PostSearchPage.dart';
import 'package:flutter/material.dart';
import 'Community/PostDetailPage.dart'; // Import your PostDetailPage.dart file here

class CommunityPage extends StatelessWidget {
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
                fontVariations: const <FontVariation>[FontVariation('wght', 700.0)],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigate to the PostSearchPage when the search button is pressed
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
              // Handle notification button press
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
              // Handle notification button press
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
          // Display user profile at the top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/sample_image.jpeg'),
                ),
                SizedBox(width: 16),
                Text(
                  '조원재',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigate to the post detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailPage(
                          username: 'Username',
                          postCaption: 'This is the post caption.',
                          postImageUrl: 'assets/sample_post_image.png',
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category and Texts
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Category', // Replace with actual category
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      '테스트',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'This is the post title and content in one line.',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          '2시간 전',
                                          style: TextStyle(color: Colors.grey, fontSize: 12),
                                        ),
                                        SizedBox(width: 8), // Add space between timestamp and icons
                                        Row(
                                          children: [
                                            Icon(Icons.remove_red_eye, size: 16),
                                            SizedBox(width: 3),
                                            Text('100', style: TextStyle(fontSize: 12)),
                                          ],
                                        ),
                                        SizedBox(width: 8), // Add space between icons
                                        Row(
                                          children: [
                                            Icon(Icons.thumb_up, size: 16),
                                            SizedBox(width: 3),
                                            Text('50', style: TextStyle(fontSize: 12)),
                                          ],
                                        ),
                                        SizedBox(width: 8), // Add space between icons
                                        Row(
                                          children: [
                                            Icon(Icons.comment, size: 16),
                                            SizedBox(width: 3),
                                            Text('5', style: TextStyle(fontSize: 12)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Post Image
                          Container(
                            margin: EdgeInsets.only(right: 8.0), // Add margin to the right side
                            height: 140, // Set the height to match the desired height
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0), // Adjust the top padding
                                child: Image.asset(
                                  'assets/sample_post_image.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),



        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostAddPage(),
            ),
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
