import 'package:common_utils/common_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/clock_widgets.dart';

class LiveClockHasDate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LiveClockHasDateState();
}

class LiveClockHasDateState extends State<LiveClockHasDate> {
  int _time;

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
        _time = value;
      });
    });
    timerUtil.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ClockWidgetsPage(),
        Text("你出生的日期和时间$_time"),
      ],
    );
  }
}
