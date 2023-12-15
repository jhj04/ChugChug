import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostAddPage extends StatefulWidget {
  @override
  _PostAddPageState createState() => _PostAddPageState();
}

class _PostAddPageState extends State<PostAddPage> {
  String selectedCategory = '과제'; // Default category
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  late ImagePicker _imagePicker;
  File? _imageFile;  // Change to File type

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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/ChugChug_Typo.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            SizedBox(width: 8),
            Text(
              'Community',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Fraunces",
                fontVariations: <FontVariation>[FontVariation('wght', 700.0)],
              ),
            ),
          ],
        ),
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
              items: ['과제', '일상', '기타']
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
                  },
                  child: Text('임시저장'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle publishing the post
                    print('게시');
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
