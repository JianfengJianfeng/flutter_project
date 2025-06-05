import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:xjf_flutter_project/app.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<LaunchPage> {

  @override
  void initState() {
    super.initState();
    //展示2s
    new Future.delayed(Duration(seconds: 2),(){
      _getHasGuidance();
    });
  }

  //判断是否需要引导页
  void _getHasGuidance ()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasGuidance = prefs.getBool("hasGuidance") ?? false;
    if (hasGuidance) {
      //已经展示过引导页
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (context) => App()),
              (route) => route == null);
    } else {
      //展示引导页
      Navigator.of(context).pushReplacementNamed("guidance");
    }
  }



  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Stack(
        children: <Widget>[
          Image.asset("images/launch.png",fit: BoxFit.cover,),
        ],
      ),
    );
  }

}