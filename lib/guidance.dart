import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:xjf_flutter_project/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Guidance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new GuidanceState();
  }
}

class GuidanceState extends State<Guidance> {

  List<ContentConfig> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new ContentConfig(
        title: "Flutter",
        description:
        "Flutter是完全免费、开源的。",
        pathImage: 'images/1.jpeg',
        foregroundImageFit: BoxFit.cover,
        styleDescription: TextStyle(
            color: Colors.cyan,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
      )
    );

    slides.add(
        new ContentConfig(
          title: "Come on",
          description:
          "这是一款使用Flutter写的应用，包含引导页、启动页、轮播图、网路请求、webview展示的实现",
          styleDescription: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'Raleway'),
          marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
          colorBegin: Color(0xffFFFACD),
          colorEnd: Color(0xffBB6359),
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
        )
    );

    slides.add(
        new ContentConfig(
          title: "Welcome",
          description:
          "分享技术，开始搬砖吧！",
          styleDescription: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'Raleway'),
          marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
          colorBegin: Color(0xffFFA500),
          colorEnd: Color(0xff7FFFD4),
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
        )
    );
  }

  void onDonePress() {
    _setHasSkip();
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) => App()),
            (route) => route == null);
  }

  void onSkipPress() {
    _setHasSkip();
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) => App()),
            (route) => route == null);
  }

  void _setHasSkip ()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("hasGuidance", true);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        listContentConfig: slides,
        onDonePress: () => onDonePress(),
        renderSkipBtn: Text("跳过", style: TextStyle(color: Colors.cyan)),
        renderNextBtn: Text("下一页", style: TextStyle(color: Colors.black)),
        renderDoneBtn: Text("进入", style: TextStyle(color: Colors.red)),
      ),
    );
  }
}