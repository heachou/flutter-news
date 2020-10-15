import 'package:flutter/material.dart';
import 'package:flutter_news/common/provider/provider.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/global.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    super.build(context);
    return Column(
      children: <Widget>[
        MaterialButton(
          onPressed: () {
            appState.switchGrayFilter();
          },
          child: Text('灰色切换 ${appState.isGrayFilter}'),
        ),
        Text('用户: ${Global.profile.displayName}'),
        Divider(),
        MaterialButton(
          onPressed: () {
            goLoginPage(context);
          },
          child: Text('退出'),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
