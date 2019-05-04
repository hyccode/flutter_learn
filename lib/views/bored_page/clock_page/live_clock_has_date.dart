import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/views/bored_page/clock_page/share_data.dart';
import 'package:flutter_app/widgets/clock_widgets.dart';

class LiveClockHasDate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LiveClockHasDateState();
}

class LiveClockHasDateState extends State<LiveClockHasDate> {
  var _time;
  int inDays = 0;

  int inHours = 0;

  int inMinutes = 0;

  int inSeconds = 0;

  DateTime birTime;

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
        if (birTime == null) {
          _time = 0;
        } else {
          var difference = DateTime.now().difference(birTime);
          inDays = difference.inDays;
          inHours = difference.inHours;
          inMinutes = difference.inMinutes;
          inSeconds = difference.inSeconds;
          _time = difference.inMicroseconds / Duration.microsecondsPerDay / 365;
          LogUtil.e(difference.toString(), tag: "difference");
        }
      });
    });
    timerUtil.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = ShareWidget.of(context).data;
    TimeOfDay timeOfDay = ShareWidget.of(context).fromTime;

    birTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
        timeOfDay.hour, timeOfDay.minute);

    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClockWidgetsPage(),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("你已经"),
              Container(
                alignment: Alignment.centerLeft,
                width: 180.0,
                margin: EdgeInsets.fromLTRB(20,0,0,0),
                height: 100.0,
                child: Text("$_time"),
              ),
              Text("岁了"),
            ],
          ),
        ),
        Text("在这个世界上你已经存在了"),
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
                Text(getYear(),textAlign: TextAlign.center,),
                Text(getMouth(),textAlign: TextAlign.center,),
                Text("$inDays\n天",textAlign: TextAlign.center,),
              ],
            ),
            TableRow(
              children: [
                Text('$inHours\n小时',textAlign: TextAlign.center,),
                Text('$inMinutes\n分钟',textAlign: TextAlign.center,),
                Text('$inSeconds\n秒',textAlign: TextAlign.center,),
              ],
            ),
          ],
        ),
      ],
    );
  }

  String getYear() {
    var d = inDays ~/ 365;
    return "$d\n年";
  }

  String getMouth() {
    var d = inDays ~/ 30;
    return "$d\n月";
  }
}
