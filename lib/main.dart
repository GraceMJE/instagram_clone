import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/body.dart';

void main() {
  runApp(const InstaCloneApp());
}

class InstaCloneApp extends StatelessWidget {
  const InstaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          // 아이콘에 라벨 보이지 않도록!
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const InstaCloneHome(),
    );
  }
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {

  // 네비게이션 바 활성화 확인을 위한 변수
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 홈화면에서만 보이게 하기
      appBar: index == 0 ? AppBar(
        title: const Text(
          'Instagram',
          // style: GoogleFonts.lobsterTwo(color: Colors.balck, fontSize: 32),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_outline, size: 32),
            onPressed: () {
              print('Tab favorite');
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.paperplane, size: 32),
            onPressed: () {
              print('Tab paperplane');
            },
          ),
        ],
      ) : null,
      body: InstaBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        // bottom네비게이션의 목표대상에 따라 상태가 달라지도록 하는 코드
        currentIndex: index,
        onTap: (newIndex) => setState(() => index = newIndex),

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 28,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 28,), label: 'Search'),
        ],
      ),
    );
  }
}
