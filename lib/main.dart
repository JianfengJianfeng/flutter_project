import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xjf_flutter_project/app.dart';
import 'package:xjf_flutter_project/guidance.dart';
import 'package:xjf_flutter_project/launch.dart';

void main() {
  runApp(const MyApp());
  if (Platform.isAndroid) {
    print("安卓设备=======");
  } else if (Platform.isIOS) {
    print("iOS设备=======");
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter工程",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "app":(BuildContext context) => new App(),
        "guidance":(BuildContext context) => new Guidance()
      },
      home: new LaunchPage(),
    );
  }
}
