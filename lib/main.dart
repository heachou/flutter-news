import 'package:flutter/material.dart';
import 'package:flutter_news/common/provider/provider.dart';
import 'package:flutter_news/global.dart';
import 'package:flutter_news/pages/index/index.dart';
import 'package:flutter_news/routes.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then(
      (e) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>.value(value: Global.appState),
        ],
        child: Consumer<AppState>(builder: (context, appState, _) {
          if (appState.isGrayFilter) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
              child: MyApp(),
            );
          } else {
            return MyApp();
          }
        }),
      )),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter news',
      home: IndexPage(),
      routes: staticRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
