import 'package:flutter/material.dart';
import 'package:flutter_news/pages/welcome/welcome.dart';
import 'package:flutter_news/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter news',
      home: WelcomePage(),
      routes: staticRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
