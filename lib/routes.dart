import 'package:flutter_news/pages/application/application.dart';
import 'package:flutter_news/pages/sign_in/sign_in.dart';
import 'package:flutter_news/pages/sign_up/sign_up.dart';

var staticRoutes = {
  "/sign-in": (context) => SignInPage(), // 登录
  "/sign-up": (context) => SignUpPage(), // 注册
  "/app": (context) => ApplicationPage(), // 主程序
};
