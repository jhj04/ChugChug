import 'package:flutter/material.dart';

class CommunityNotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false, // Left-align the title
        title: Image.asset('assets/chugchug.png', fit: BoxFit.contain, height: 50,),
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
