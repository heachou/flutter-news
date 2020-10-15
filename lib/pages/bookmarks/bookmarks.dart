import 'package:flutter/material.dart';

class BookmarksPage extends StatefulWidget {
  BookmarksPage({Key key}) : super(key: key);

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Text('bookmarks'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
