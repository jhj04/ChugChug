import 'package:chugchug/Widgets/Bar_Widgets.dart';
import 'package:flutter/material.dart';

class PostSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false, // Left-align the title
        title: Top_Logos("Community", 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '제목/내용 검색',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 0, // Replace with the actual number of search results
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Search Result $index'),
                    // Handle tapping on search results if needed
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
