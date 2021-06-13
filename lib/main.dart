import 'package:flutter/material.dart';
import 'package:sfv_lounge/view/basepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: BasePage(),
    );
  }
}
