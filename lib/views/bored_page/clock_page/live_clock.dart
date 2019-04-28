import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/shared_preferences.dart';
import 'package:flutter_app/views/bored_page/clock_page/live_clock_has_date.dart';
import 'package:flutter_app/views/bored_page/clock_page/live_clock_no_date.dart';
import 'package:flutter_app/views/bored_page/clock_page/share_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LiveClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LivePageState();
}

class LivePageState extends State<LiveClock>
    with AutomaticKeepAliveClientMixin {
//  DateTime _fromDate = DateTime.now();
//  TimeOfDay _fromTime = const TimeOfDay(hour: 0, minute: 0);


  @override
  void initState() {
    super.initState();
    print("live");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
      child: getView(context),
    );
  }

  getView(BuildContext context) {
    if (ShareWidget.of(context).data!=null && ShareWidget.of(context).fromTime!=null) {
      return ShareWidget(
        data: ShareWidget.of(context).data,
        fromTime: ShareWidget.of(context).fromTime,
        child: LiveClockHasDate(),
      );
    } else {
      return ShareWidget(
        data: ShareWidget.of(context).data,
        fromTime: ShareWidget.of(context).fromTime,
        child: LiveClockNoDate(),
      );
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
