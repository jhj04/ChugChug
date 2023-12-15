// Quest.dart

import 'dart:ui';

import 'package:chugchug/Quest/QuestDetailPage.dart';
import 'package:flutter/material.dart';

class QuestPage extends StatelessWidget {
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
              'Quest',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Fraunces",
                fontVariations: const <FontVariation>[FontVariation('wght', 700.0)],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            // Larger Character at the center
            Container(
              width: 200, // Adjust the width to make the character larger
              height: 200, // Adjust the height to make the character larger
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // Customize the character appearance
              ),
              child: Center(
                child:Image.asset(
                  'chugchug_character.png',
                  ),
              ),
            ),
            SizedBox(height: 20), // Add spacing between character and quests

            // List of Quests
            Expanded(
              child: ListView(
                children: [
                  QuestItem(title: '예시 퀘스트 1', description: '퀘스트를 완료하세요!'),
                  QuestItem(title: '조원재 밥 사주기', description: '배고파요'),
                  QuestItem(title: '크리스마스', description: '야무지게 가져가야지'),
                  // Add more quest items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestItem extends StatelessWidget {
  final String title;
  final String description;

  const QuestItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Handle quest item tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestDetailPage(
                title: title,
                description: description,
              ),
            ),
          );
        },
      ),
    );
  }
}
