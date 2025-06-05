import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xjf_flutter_project/base/_base_widge.dart';
import 'package:xjf_flutter_project/ui/home/banner.dart';

class HomePage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return HomePageState();
  }
}

class HomePageState extends BaseWidgetState<HomePage> {
  @override
  void initState() {
    super.initState();
    setAppBarVisible(false);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
            BannerWidget(), // 添加 BannerWidget
            Expanded(
              child: ListView(
                children: [
                  // 其他内容...
                ],
              ),
            ),
          ],
        ),
      );
    }

  @override
  AppBar getAppBar() {
    return AppBar(
      title: Text("不显示"),
    );
  }

  @override
  Widget getContentWidget(BuildContext context) {
    return Scaffold(

    );
  }
  @override
  void onClickErrorWidget() {
    showloading();
  }
}