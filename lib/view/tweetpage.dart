import 'package:flutter/material.dart';

class TweetPage extends StatefulWidget {
  @override
  _TweetPageState createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('募集する'),
        centerTitle: true,
        actions: <Widget>[IconButton(icon: Icon(Icons.help), onPressed: null)],
      ),
      body: Center(
          child: Column(children: <Widget>[
        Column(children: <Widget>[
          Text('【ID】'),
          TextField(),
        ]),
        Column(children: <Widget>[
          Text('【キャラ】'),
          TextField(),
        ]),
        Column(children: <Widget>[
          Text('【LP】'),
          TextField(),
        ]),
        Column(children: <Widget>[
          Text('【ルール】'),
          TextField(),
        ]),
        Column(children: <Widget>[
          Text('【パス】'),
          TextField(),
        ]),
        Column(children: <Widget>[
          Text('【コメント】'),
          TextField(),
        ]),
      ])),
    );
  }
}
