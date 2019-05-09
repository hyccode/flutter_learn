import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/views/bored_page/clock_page/share_data.dart';
import 'package:flutter_app/widgets/clock_widgets.dart';

class DeathClockHasDate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeathClockHasDateState();
}

class DeathClockHasDateState extends State<DeathClockHasDate> {
  var _time;
  int inDays = 0;

  int inHours = 0;

  int inMinutes = 0;

  int inSeconds = 0;

  DateTime deathTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    TimerUtil timerUtil = new TimerUtil();
    timerUtil.setInterval(1);
    timerUtil.setOnTimerTickCallback((int value) {
      // mounted 为 true 表示当前页面挂在到构件树中，为 false 时未挂载当前页面
      if (!mounted) {
        return;
      }
      setState(() {
        if (deathTime == null) {
          _time = 0;
        } else {
          var difference = deathTime.difference(DateTime.now());
          inDays = difference.inDays;
          inHours = difference.inHours;
          inMinutes = difference.inMinutes;
          inSeconds = difference.inSeconds;
          _time = difference.inMicroseconds / Duration.microsecondsPerDay;
//          LogUtil.e(difference.toString(), tag: "difference");
        }
      });
    });
    timerUtil.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = ShareWidget.of(context).data;
    TimeOfDay timeOfDay = ShareWidget.of(context).fromTime;

    DateTime birTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
        timeOfDay.hour, timeOfDay.minute);
    deathTime = birTime
        .add(new Duration(days: ShareWidget.of(context).deathYear * 365));

    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/images/death_clock_buttom.png",
          color: Colors.white,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "离终结还有",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 180.0,
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                height: 100.0,
                child: Text(
                  "$_time",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                "天了",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Text(
          "剩下的日子你大概可以",
          style: TextStyle(color: Colors.white),
        ),
        Table(
          columnWidths: const {
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(100.0),
            2: FixedColumnWidth(100.0),
          },
          border: TableBorder.all(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
          children: [
            TableRow(
              children: [
                Text(
                  getString(0),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  getString(1),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  getString(2),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  getString(3),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  getString(4),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  getString(5),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  String getString(int type) {
    switch (type) {
      case 0:
        var d = inDays * 3;
        return "吃饭$d次>";
      case 1:
        var d = inDays ~/ 200;
        return "看书$d本>";
      case 2:
        var d = inDays ~/ 60;
        return "做爱$d次>";
      case 3:
        var d = inDays ~/ 50;
        return "玩游戏$d次>";
      case 4:
        var d = inDays ~/ 5;
        return "拉屎$d次>";
      case 5:
        var d = inDays ~/ 150;
        return "陪父母$d天>";
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("death_has Dependencies change");
  }
}
