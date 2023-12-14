import 'package:chugchug/Widgets/Bar_Widgets.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  final String username;
  final String postDateTime;
  final String postTitle;
  final String postImageUrl;
  final String postBodyText;

  const PostDetailPage({super.key,
    required this.username,
    required this.postImageUrl,
    required this.postTitle,
    required this.postDateTime,
    required this.postBodyText,
  });

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  int likes = 0; // 좋아요 수
  int comments = 0; // 댓글 수
  List<String> commentList = []; // 댓글 리스트

  TextEditingController commentController = TextEditingController();

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
              // Navigate to search page
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to notifications page
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Navigate to menu page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_sample.png'),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.postDateTime,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(likes > 0 ? Icons.favorite : Icons.favorite_border),
                    color: likes > 0 ? Colors.red : null,
                    onPressed: () {
                      setState(() {
                        if (likes > 0) {
                          likes--;
                        } else {
                          likes++;
                        }
                      });
                    },
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
                widget.postTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset(
              widget.postImageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.postBodyText,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '댓글 ${commentList.length}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                        hintText: '댓글을 입력하세요',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      comments++;
                      commentList.add(commentController.text);
                      commentController.clear();
                    });
                  },
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: commentList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(commentList[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
