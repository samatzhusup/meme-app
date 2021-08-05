import 'package:flutter/material.dart';
import 'package:mytest/locator.dart';
import 'package:mytest/view/home_page.dart';

void main() async {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get_it',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageView(),
    );
  }
}
