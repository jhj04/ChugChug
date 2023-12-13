import 'package:chugchug/Community/Community.dart';
import 'package:chugchug/Home/Home.dart';
import 'package:chugchug/Quest/Quest.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "척척",
      theme: ThemeData(
        // 전체 배경 색 설정
        scaffoldBackgroundColor: Color(0xfff5f1e5), // 여기에서 원하는 색상을 선택하세요
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1; // 현재 선택된 페이지 인덱스

  final List<Widget> _pages = [
    // 여기에 앱의 여러 페이지 위젯을 추가합니다.
    // 예를 들면, MyWidget(), QuestPage(), CommunityPage() 등
    QuestPage(),
    HomePage(),
    CommunityPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // 선택된 페이지를 표시합니다.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // 현재 선택된 페이지 인덱스 설정
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // 페이지가 탭될 때 현재 페이지 인덱스 업데이트
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: '퀘스트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.commit),
            label: '커뮤니티',
          ),
        ],
      ),
    );
  }
}
