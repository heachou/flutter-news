import 'package:flutter_news/pages/application/application.dart';
import 'package:flutter_news/pages/index/index.dart';
import 'package:flutter_news/pages/sign_in/sign_in.dart';
import 'package:flutter_news/pages/sign_up/sign_up.dart';
import 'package:flutter_news/pages/welcome/welcome.dart';

var staticRoutes = {
  '/welcome': (context) => WelcomePage(), // 欢迎页
  '/index': (context) => IndexPage(), // index
  "/sign-in": (context) => SignInPage(), // 登录
  "/sign-up": (context) => SignUpPage(), // 注册
  "/app": (context) => ApplicationPage(), // 主程序
};
