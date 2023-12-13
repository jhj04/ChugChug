import 'package:chugchug/GoogleSheetsHelper.dart';

final GoogleSheetsHelper sheetsHelper = GoogleSheetsHelper();

class Post {
  final String category;
  final String title;
  final String subtitle;
  final String timestamp;
  final String views;
  final String likes;
  final String comments;
  final String imageUrl;

  Post({
    required this.category,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.views,
    required this.likes,
    required this.comments,
    required this.imageUrl,
  });
}

Future<List<Post>> getPostList() async {
  List<Post> posts = [];

  // Initialize Google Sheets helper
  await sheetsHelper.init();

  // Load data from Google Sheets
  List<dynamic> datas = await sheetsHelper.loadData();

  // Process and convert data to Post objects
  for (var data in datas.reversed) {
    posts.add(
        Post(
          category: data[3] ?? '', // Replace 'category' with the actual column name in your Google Sheets
          title: data[2] ?? '',       // Replace 'title' with the actual column name in your Google Sheets
          subtitle: data[4] ?? '', // Replace 'subtitle' with the actual column name in your Google Sheets
          timestamp: "1분 전",//data[0] ?? '', // Replace 'timestamp' with the actual column name in your Google Sheets
          views: data[5] ?? '',        // Replace 'views' with the actual column name in your Google Sheets
          likes: data[6] ?? '',        // Replace 'likes' with the actual column name in your Google Sheets
          comments: data[7] ?? '',  // Replace 'comments' with the actual column name in your Google Sheets
          imageUrl: 'assets/sample_post_image.png',//data['imageUrl'] ?? '', // Replace 'imageUrl' with the actual column name in your Google Sheets
        )
    );
  }

  return posts;
}
