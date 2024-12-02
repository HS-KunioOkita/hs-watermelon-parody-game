import 'package:flutter/material.dart';
import 'view/top_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Top Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TopPage(),
    );
  }
}
