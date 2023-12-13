import 'dart:ui';

import 'package:chugchug/Widgets/Bar_Widgets.dart';
import 'package:flutter/material.dart';

class QuestDetailPage extends StatelessWidget {
  final String title;
  final String description;

  QuestDetailPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Top_Logos("Quest", 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quest Title: $title',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Quest Description: $description',
              style: TextStyle(fontSize: 16),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
