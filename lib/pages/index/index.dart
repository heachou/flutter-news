import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/update.dart';
import 'package:flutter_news/global.dart';
import 'package:flutter_news/pages/application/application.dart';
import 'package:flutter_news/pages/sign_in/sign_in.dart';
import 'package:flutter_news/pages/welcome/welcome.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();

    if (Global.isRelease == true) {
      doAppUpdate();
    }
  }

  Future doAppUpdate() async {
    await Future.delayed(Duration(seconds: 2), () async {
      if (Global.isIOS == false &&
          await Permission.storage.isGranted == false) {
        await [Permission.storage].request();
      }
      if (await Permission.storage.isGranted) {
        AppUpdateUtil().run(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );
    return Scaffold(
      body: Global.isFirstOpen
          ? WelcomePage()
          : Global.isOfflineLogin ? ApplicationPage() : SignInPage(),
    );
  }
}
