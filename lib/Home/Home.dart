import 'package:chugchug/Community/CommunityNotifications.dart';
import 'package:chugchug/Home/HomeMenu.dart';
import 'package:chugchug/Widgets/Bar_Widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username = "조원재"; // 사용자 이름 변수
  final int completedQuests = 5; // 완료한 퀘스트 수 변수
  final int remainingQuests = 10; // 남은 퀘스트 수 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Top_Logos("Home", 16),

        actions: [
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
                  builder: (context) => HomeMenuPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$username 보호자님,\n환영합니다.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '완료한 퀘스트: $completedQuests',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '남은 퀘스트: $remainingQuests',
              style: TextStyle(fontSize: 18),
            ),
            // 이후 추가적인 홈 페이지 내용을 원하는 대로 추가할 수 있습니다.
          ],
        ),
      ),
    );
  }
}
