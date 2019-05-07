import 'dart:async';

import 'package:intl/intl.dart' as date;
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/utils/shared_preferences.dart';
import 'package:flutter_app/views/bored_page/clock_page/page_clock.dart';
import 'package:flutter_app/views/bored_page/clock_page/share_data.dart';
import 'package:flutter_app/views/practice_page/page_indicator_page/page_dragger.dart';
import 'package:flutter_app/views/practice_page/page_indicator_page/page_reveal.dart';
import 'package:flutter_app/views/practice_page/page_indicator_page/pager_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockPage extends StatefulWidget {
  @override
  ClockPageState createState() => ClockPageState();
}

class ClockPageState extends State<ClockPage> with TickerProviderStateMixin {
  StreamController<SlideUpdate> slideUpdateStream;
  AnimatedPageDragger animatedPageDragger;

  int activeIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  int nextPageIndex = 0;
  int waitingNextPageIndex = -1;

  double slidePercent = 0.0;

  //选择的年龄
  int deathYear = 0;

  //出生年月
  DateTime _fromDate;

  TimeOfDay _fromTime;

  _notifyDataTime(DateTime value) {
    putDate(0, value);
    setState(() {
      _fromDate = value;
    });
  }

  _notifyTimeOfDay(value) {
    putDate(1, value);
    setState(() {
      _fromTime = value;
    });
  }

  _notifyDeathYear(value) {
    putDate(2, value);
    setState(() {
      deathYear = value;
    });
  }

  ClockPageState() {
    slideUpdateStream = new StreamController<SlideUpdate>();

    slideUpdateStream.stream.listen((SlideUpdate event) {
      if (mounted) {
        setState(() {
          if (event.updateType == UpdateType.dragging) {
            slideDirection = event.direction;
            slidePercent = event.slidePercent;

            if (slideDirection == SlideDirection.leftToRight) {
              nextPageIndex = activeIndex - 1;
            } else if (slideDirection == SlideDirection.rightToLeft) {
              nextPageIndex = activeIndex + 1;
            } else {
              nextPageIndex = activeIndex;
            }
          } else if (event.updateType == UpdateType.doneDragging) {
            if (slidePercent > 0.5) {
              animatedPageDragger = new AnimatedPageDragger(
                slideDirection: slideDirection,
                transitionGoal: TransitionGoal.open,
                slidePercent: slidePercent,
                slideUpdateStream: slideUpdateStream,
                vsync: this,
              );
            } else {
              animatedPageDragger = new AnimatedPageDragger(
                slideDirection: slideDirection,
                transitionGoal: TransitionGoal.close,
                slidePercent: slidePercent,
                slideUpdateStream: slideUpdateStream,
                vsync: this,
              );

              waitingNextPageIndex = activeIndex;
            }

            animatedPageDragger.run();
          } else if (event.updateType == UpdateType.animating) {
            slideDirection = event.direction;
            slidePercent = event.slidePercent;
          } else if (event.updateType == UpdateType.doneAnimating) {
            if (waitingNextPageIndex != -1) {
              nextPageIndex = waitingNextPageIndex;
              waitingNextPageIndex = -1;
            } else {
              activeIndex = nextPageIndex;
            }

            slideDirection = SlideDirection.none;
            slidePercent = 0.0;

            animatedPageDragger.dispose();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    slideUpdateStream.close();
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _userName = '';

  @override
  void initState() {
    super.initState();

    getDate();

    Future<String> _user = _prefs.then((SharedPreferences prefs) {
      return prefs.getString(SharedPreferencesKeys.UserId);
    });

    _user.then((String name) {
      new Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _userName = name;
        });
      });
    });
  }

  /**
   * 获取缓存
   */
  void getDate() async {
    SpUtil instance = await SpUtil.getInstance();

    String string = instance.getString(SharedPreferencesKeys.birthday);
    if (string != null && string.isNotEmpty) {
      _fromDate = DateUtil.getDateTime(string);

      LogUtil.e(string, tag: "date");
      LogUtil.e(_fromDate.toString(), tag: "date");
    }

    String string_time =
        instance.getString(SharedPreferencesKeys.birthday_time);
    if (string_time != null && string_time.isNotEmpty) {
      _fromTime = TimeOfDay(
          hour: int.parse(string_time.split(":")[0]),
          minute: int.parse(string_time.split(":")[1]));
      LogUtil.e(string_time, tag: "time");
      LogUtil.e(_fromTime.toString(), tag: "time");
    }

    deathYear = instance.getInt(SharedPreferencesKeys.death_year);
  }

  /**
   * 存数据
   */
  void putDate(int type, var data) async {
    SpUtil instance = await SpUtil.getInstance();
    if (type == 0) {
      if (data is DateTime) {
        instance.putString(SharedPreferencesKeys.birthday, data.toString());
      }
    } else if (type == 1) {
      if (data is TimeOfDay) {
        instance.putString(
            SharedPreferencesKeys.birthday_time, '${data.hour}:${data.minute}');
      }
    } else if (type == 2) {
      if (data is int) {
        instance.putInt(SharedPreferencesKeys.death_year, data);
      }
    }
  }

  /**
   * 清除缓存  type 0。生 1。死
   */
  void clearDate(int type) async {
    SpUtil instance = await SpUtil.getInstance();
    if (type == 0) {
      instance.remove(SharedPreferencesKeys.birthday);
      instance.remove(SharedPreferencesKeys.birthday_time);
      _fromDate = null;
      _fromTime = null;
    } else if (type == 1) {
      instance.remove(SharedPreferencesKeys.death_year);
      deathYear = 0;
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShareWidget(
      data: _fromDate,
      fromTime: _fromTime,
      deathYear: deathYear,
      notifyDataTime: _notifyDataTime,
      notifyDeathYear: _notifyDeathYear,
      notifyTimeOfDay: _notifyTimeOfDay,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Application.router.pop(context);
              }),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ],
        ),
        body: new Stack(
          children: [
            new PageClock(
              // page 的主要内容
              viewModel: pages_clock[activeIndex],
              percentVisible: 1.0,
            ),
            new PageReveal(
              revealPercent: slidePercent,
              child: new PageClock(
                viewModel: pages_clock[nextPageIndex],
                percentVisible: slidePercent,
              ),
            ),
            new PagerIndicator(
              viewModel: new PagerIndicatorViewModel(
                pages_clock,
                activeIndex,
                slideDirection,
                slidePercent,
              ),
            ),
            new PageDragger(
              canDragLeftToRight: activeIndex > 0,
              canDragRightToLeft: activeIndex < pages_clock.length - 1,
              slideUpdateStream: this.slideUpdateStream,
            ),
          ],
        ),
        endDrawer: _drawer,
      ),
    );
  }

  get _drawer => Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(_userName),
              accountEmail: Text(_userName),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.red,
              ),
              margin: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
                clearDate(0);
                setState(() {
                  activeIndex = 0;
                });
              },
              subtitle: (_fromDate != null && _fromTime != null)
                  ? Text(getBirday())
                  : null,
              title: Text("重设生日"),
            ),
            ListTile(
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
                clearDate(1);
                setState(() {
                  activeIndex = 1;
                });
              },
              subtitle: deathYear != null &&
                  deathYear > 0
                  ? Text("活到$deathYear岁")
                  : null,
              title: Text("重设寿命"),
            ),
          ],
        ),
      );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("clock Dependencies change");
  }

  String getBirday() {
    var format = date.DateFormat.yMMMd().format(_fromDate);
    var format2 = _fromTime.format(context);
    return format + format2;
  }
}

final pages_clock = [
  PageViewClockModel(const Color(0xFFcd344f), "生命时钟",
      'assets/images/live_clock_buttom.png', 1),
  PageViewClockModel(const Color(0xFF638de3), "死亡时钟",
      'assets/images/death_clock_buttom.png', 2),
];

class PageViewClockModel {
  final Color color;
  final String title;
  final String iconAssetPath;
  final int position;

  PageViewClockModel(
    this.color,
    this.title,
    this.iconAssetPath,
    this.position,
  );
}
