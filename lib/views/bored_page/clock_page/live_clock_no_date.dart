import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/shared_preferences.dart';
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
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          "你出生的日期和时间",
        ),
        DateTimePicker(
          selectedDate: ShareWidget.of(context).data??DateTime.now(),
          selectedTime: ShareWidget.of(context).fromTime??TimeOfDay(hour: 0, minute: 0),
          selectDate: (DateTime date) {
            putDate(0, date);
            setState(() {
              ShareWidget.of(context).data = date;
            });
          },
          selectTime: (TimeOfDay time) {
            putDate(1, time);
            setState(() {
              ShareWidget.of(context).fromTime = time;
            });
          },
        ),
      ],
    );
  }

  void putDate(int type, var data) async {
    SpUtil instance = await SpUtil.getInstance();
    if (type == 0) {
      if(data is DateTime){
        instance.putString(SharedPreferencesKeys.birthday, data.toString());
      }
    } else if (type == 1) {
      if(data is TimeOfDay){
        instance.putString(SharedPreferencesKeys.birthday_time, data.format(context));
      }
    }
  }
}
