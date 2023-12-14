import 'package:chugchug/Account/AccountSetting.dart';
import 'package:chugchug/Community/CommunityMenu.dart';
import 'package:chugchug/Community/CommunityNotifications.dart';
import 'package:chugchug/Community/PostAddPage.dart';
import 'package:chugchug/Community/PostSearchPage.dart';
import 'package:chugchug/Widgets/Bar_Widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'PostDetailPage.dart';
import 'Post.dart';

// ignore: must_be_immutable
class CommunityPage extends StatelessWidget {

  String userName = "";

  CommunityPage({super.key});

  void getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName') ?? '무명';
  }


  @override
  Widget build(BuildContext context) {

    getUserName();

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
      body: FutureBuilder<List<Post>>(
        future: getPostList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<Post> posts = snapshot.data ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/profile_sample.png'),
                      ),
                      SizedBox(width: 16),
                      Text(
                        userName, // 설정한 별명 표시
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountSettingPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostDetailPage(
                                username: post.author,
                                postTitle: post.title,
                                postBodyText: post.bodyText,
                                postImageUrl: post.imageUrl,
                                postDateTime: post.timestamp,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder( // 이 부분 제거
                            borderRadius: BorderRadius.circular(0.0), // 이 부분 제거
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0, top: 2.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        post.category,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          post.title,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          post.bodyText,
                                          style: TextStyle(fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              post.author,
                                              style: TextStyle(color: Colors.grey, fontSize: 12),
                                            ),
                                            Text(
                                              " · ",
                                              style: TextStyle(color: Colors.grey, fontSize: 12),
                                            ),
                                            Text(
                                              post.timestamp,
                                              style: TextStyle(color: Colors.grey, fontSize: 12),
                                            ),
                                            SizedBox(width: 8),
                                            Row(
                                              children: [
                                                Icon(Icons.remove_red_eye, size: 16),
                                                SizedBox(width: 3),
                                                Text(post.views.toString(), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                            SizedBox(width: 8),
                                            Row(
                                              children: [
                                                Icon(Icons.thumb_up, size: 16),
                                                SizedBox(width: 3),
                                                Text(post.likes.toString(), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                            SizedBox(width: 8),
                                            Row(
                                              children: [
                                                Icon(Icons.comment, size: 16),
                                                SizedBox(width: 3),
                                                Text(post.comments.toString(), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 8.0),
                                height: 120,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Image.asset(
                                      post.imageUrl,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );

                    },
                  ),
                ),
              ],
            );
          }
        },
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
