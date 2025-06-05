import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xjf_flutter_project/ui/home/home_page.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  int _selectedIndex = 0; //当前选中项的索引
  final appBarTitles = ['首页', '我的'];

  var pages = <Widget>[
    HomePage(),
    HomePage()
  ];


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: new Text(appBarTitles[_selectedIndex]),
          bottom: null,
          elevation: 0,
        ),
        body: new IndexedStack(children: pages, index: _selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.assignment),label: "我的"),
          ],
          type: BottomNavigationBarType.fixed, //设置显示的模式
          currentIndex: _selectedIndex, //当前选中项的索引
          onTap: _onItemTapped, //选择按下处理
        ),
      ),
    );
  }

  //选择按下处理 设置当前索引为index值
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Future<bool> _onWillPop() async {
  //   final shouldExit = await showDialog<bool>(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('提示'),
  //       content: const Text('确定退出应用吗？'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(false),
  //           child: const Text('再看一会'),
  //         ),
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(true),
  //           child: const Text('退出'),
  //         ),
  //       ],
  //     ),
  //   );
  //   return shouldExit ?? false; // 如果用户直接关闭对话框（返回 null），默认返回 false
  // }

}