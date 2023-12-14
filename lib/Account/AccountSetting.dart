import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSettingPage extends StatefulWidget {
  @override
  _AccountSettingPageState createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  String profileImageUrl = 'assets/sample_image.jpeg';
  String userName = '조원재';
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  void _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '조원재';
      _nameController.text = userName;
    });
  }

  void _changeProfilePicture() async {
    // TODO: 프로필 사진 변경 로직을 구현하세요.
  }

  void _changeUserName() async {
    final newUserName = _nameController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', newUserName);

    setState(() {
      userName = newUserName;
    });

    // 이름이 변경되면 labelText 업데이트
    setState(() {
      _nameController.text = userName;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('계정 설정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _changeProfilePicture,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(profileImageUrl),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 20,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: '현재 별명: $userName',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _changeUserName,
                  child: Text('저장'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
