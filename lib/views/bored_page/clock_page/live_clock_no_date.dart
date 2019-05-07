import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/views/bored_page/clock_page/share_data.dart';
import 'package:flutter_app/widgets/date_picker.dart';

class LiveClockNoDate extends StatefulWidget {
  LiveClockNoDate({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => LiveClockNoDateState();
}

class LiveClockNoDateState extends State<LiveClockNoDate> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          "你出生的日期和时间",
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: DateTimePicker(
            selectedDate: ShareWidget.of(context).data ?? DateTime.now(),
            selectedTime: ShareWidget.of(context).fromTime ?? TimeOfDay.now(),
            selectDate: (DateTime date) {
              ShareWidget.of(context).notifyDataTime(date);
            },
            selectTime: (TimeOfDay time) {
              ShareWidget.of(context).notifyTimeOfDay(time);
            },
          ),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("live_no Dependencies change");
  }
}
