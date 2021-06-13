import 'package:flutter/material.dart';
import 'package:sfv_lounge/view/tagpage.dart';
import 'package:sfv_lounge/view/tweetpage.dart';

import 'datapage.dart';

class BasePage extends StatefulWidget {
  @override
  createState() => _BasePageState();
}

// When using component stack
class _BasePageState extends State<BasePage> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildOffstage(0, TagPage()),
          _buildOffstage(1, TweetPage()),
          _buildOffstage(2, DataPage()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        selectedFontSize: 13,
        unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              IconData(59621, fontFamily: 'MaterialIcons'),
            ),
            label: '#募集を見る',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              IconData(59621, fontFamily: 'MaterialIcons'),
            ),
            label: '募集する',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(59621, fontFamily: 'MaterialIcons'),
            ),
            label: 'データ',
          ),
        ],
      ),
    );
  }

  // onstage view is only visible
  Widget _buildOffstage(int index, Widget page) {
    return Offstage(
      offstage: index != _index,
      child: TickerMode(
        enabled: index == _index,
        child: page,
      ),
    );
  }
}
