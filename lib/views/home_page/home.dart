import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routers.dart';
import 'package:flutter_app/utils/shared_preferences.dart';
import 'package:flutter_app/views/about_page/about.dart';
import 'package:flutter_app/views/bored_page/bored.dart';
import 'package:flutter_app/views/practice_page/practice.dart';
import 'package:flutter_app/widgets/progress_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  String _name;

  var list = ["无聊的功能", "练习", "关于"];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _controller = new PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
  }

  /**
   * 获取缓存
   */
  void getDate() async {
    SpUtil instance = await SpUtil.getInstance();
    String s = instance.getString(SharedPreferencesKeys.UserId);
    setState(() {
      _name = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(list[_currentIndex]),
      ),
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
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          BoredPage(),
          PracticePage(),
          AboutPage(),
        ],
      ),
      drawer: _drawer,
    );
  }

  get _drawer => Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(_name ?? ""),
              accountEmail: Text("个人简介"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/author_head.jpg",
                ),
                backgroundColor: Colors.red,
              ),
              margin: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {
                _scaffoldKey.currentState.openEndDrawer();
                Application.router.navigateTo(context,
                    '${Routes.webViewPage}?title=${Uri.encodeComponent("关于无聊")} Doc&&url=${Uri.encodeComponent("https://github.com/hyccode/flutter_learn")}');
              },
              title: Text("github"),
            ),
            ListTile(
              onTap: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
              title: Text("设置"),
            ),
            ListTile(
              onTap: () {
                _scaffoldKey.currentState.openEndDrawer();
                clearDate();
              },
              title: Text("退出"),
            ),
          ],
        ),
      );

  /**
   * 清除缓存并跳转登录页
   */
  void clearDate() async {
    SpUtil instance = await SpUtil.getInstance();
    instance.remove(SharedPreferencesKeys.UserId);
    Application.router.navigateTo(context, Routes.login, clearStack: true);
  }
}
