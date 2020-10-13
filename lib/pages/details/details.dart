import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String url;

  DetailsPage({Key key, this.title, this.url}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detail page'),
      ),
      body: Container(
        child: Text('${widget.title} ${widget.url}'),
      ),
    );
  }
}
