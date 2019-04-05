import 'package:flutter/material.dart';
import 'package:flutter_app/views/home_page/about.dart';
import 'package:flutter_app/views/home_page/bored.dart';
import 'package:flutter_app/views/home_page/practice.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  PageController _controller = new PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultColor,
            ),
            title: Text(
              "无聊",
              style: TextStyle(
                color: _currentIndex == 0 ? _activeColor : _defaultColor,
              ),
            ),
            activeIcon: Icon(
              Icons.home,
              color: _activeColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.keyboard,
              color: _defaultColor,
            ),
            title: Text("练习",
                style: TextStyle(
                  color: _currentIndex == 1 ? _activeColor : _defaultColor,
                )),
            activeIcon: Icon(
              Icons.keyboard,
              color: _activeColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.import_contacts,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.import_contacts,
              color: _activeColor,
            ),
            title: Text("关于",
                style: TextStyle(
                  color: _currentIndex == 2 ? _activeColor : _defaultColor,
                )),
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          BoredPage(),
          PracticePage(),
          AboutPage(),
        ],
      ),
    );
  }
}
