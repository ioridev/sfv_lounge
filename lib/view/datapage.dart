import 'dart:convert';

import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('データ'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.help), onPressed: null)
          ],
        ),
        body: Container());
  }
}
