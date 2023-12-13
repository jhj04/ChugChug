import 'dart:io';
import 'package:chugchug/GoogleSheetsHelper.dart';
import 'package:chugchug/Widgets/Bar_Widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostAddPage extends StatefulWidget {
  @override
  _PostAddPageState createState() => _PostAddPageState();
}

class _PostAddPageState extends State<PostAddPage> {
  String selectedCategory = '궁금해요'; // Default category
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  late ImagePicker _imagePicker;
  File? _imageFile;  // Change to File type
  final GoogleSheetsHelper sheetsHelper = GoogleSheetsHelper();

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _getImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _imageFile = File(image.path);  // Convert XFile to File
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize Google Sheets helper in the constructor or initState
    sheetsHelper.init();

    return Scaffold(
      appBar: AppBar(
        title: Top_Logos("Community", 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: '글 제목',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              value: selectedCategory,
              items: ['궁금해요', '모여요', '공유해요']
                  .map((category) => DropdownMenuItem(
                value: category,
                child: Text(category),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value.toString();
                });
              },
              decoration: InputDecoration(
                labelText: '분류',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('이미지 선택'),
            ),
            SizedBox(height: 16),
            _imageFile != null
                ? Image.file(
              _imageFile!,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            )
                : Container(),
            SizedBox(height: 16),
            TextField(
              controller: contentController,
              maxLines: 8,
              decoration: InputDecoration(
                labelText: '내용',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle saving as a draft
                    print('임시저장');
                    String title = titleController.text;
                    String category = selectedCategory;
                    String content = contentController.text;

                    // 이제 title, category, content 변수에 텍스트 필드에서 가져온 값이 저장됩니다.
                  },
                  child: Text('임시저장'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle publishing the post
                    print('게시');
                    String title = titleController.text;
                    String category = selectedCategory;
                    String content = contentController.text;

                    // 이제 title, category, content 변수에 텍스트 필드에서 가져온 값이 저장됩니다.
                    sheetsHelper.savePostData([title, category, content]);
                  },
                  child: Text('게시'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
