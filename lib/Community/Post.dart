import 'package:chugchug/GoogleSheetsHelper.dart';

final GoogleSheetsHelper sheetsHelper = GoogleSheetsHelper();

class Post {
  final String category;
  final String author;
  final String title;
  final String bodyText;
  final String timestamp;
  final String views;
  final String likes;
  final String comments;
  final String imageUrl;

  Post({
    required this.category,
    required this.author,
    required this.title,
    required this.bodyText,
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
  datas.removeAt(0);

  // Process and convert data to Post objects
  for (var data in datas.reversed) {
    String date = data[0].substring(0, 8);
    String time = data[0].substring(8, 12);
    DateTime dt = DateTime.parse('${date}T$time');


    posts.add(
        Post(
          category: data[3] ?? '', // Replace 'category' with the actual column name in your Google Sheets
          author: data[1] ?? '',
          title: data[2] ?? '',       // Replace 'title' with the actual column name in your Google Sheets
          bodyText: data[4] ?? '', // Replace 'subtitle' with the actual column name in your Google Sheets
          timestamp: formatDate(dt), // ?? '', // Replace 'timestamp' with the actual column name in your Google Sheets
          views: data[5] ?? '',        // Replace 'views' with the actual column name in your Google Sheets
          likes: data[6] ?? '',        // Replace 'likes' with the actual column name in your Google Sheets
          comments: data[7] ?? '',  // Replace 'comments' with the actual column name in your Google Sheets
          imageUrl: 'assets/sample_post_image.png',//data['imageUrl'] ?? '', // Replace 'imageUrl' with the actual column name in your Google Sheets
        )
    );
  }
  return posts;
}

String formatDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);
  if (difference.inMinutes < 1) {
    return '방금 전';
  } else if (difference.inHours < 1) {
    return '${difference.inMinutes}분전';
  } else if (difference.inDays < 1) {
    return '${difference.inHours}시간 전';
  } else {
    return '${date.year}.${date.month}.${date.day}';
  }
}