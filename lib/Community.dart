import 'package:flutter/material.dart';
import 'PostDetailPage.dart'; // Import your PostDetailPage.dart file here

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false, // Left-align the title
        title: Image.asset('assets/chugchug.png', fit: BoxFit.contain, height: 50,),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
              print('Search Button Pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
              print('Notification Button Pressed');
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
              children: [
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
              itemCount: 5, // Adjust the number of posts as needed
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailPage(
                          username: 'Username', // Replace with actual username
                          postCaption: 'This is the post caption.', // Replace with actual caption
                          postImageUrl: 'assets/sample_post_image.png', // Replace with actual image
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage('assets/sample_image.jpeg'),
                              ),
                              title: Text('테스트'),
                              subtitle: Text('Posted 2 hours ago'),
                            ),
                            Image.asset(
                              'assets/sample_post_image.png', // Replace with your post image
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'This is the post caption. Write your own caption here!',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.thumb_up),
                                  onPressed: () {
                                    // Handle like button press
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.comment),
                                  onPressed: () {
                                    // Handle comment button press
                                  },
                                ),
                              ],
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
          // Handle the button press to create a new post
          print('Create Post Button Pressed');
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
