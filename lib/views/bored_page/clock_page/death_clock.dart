import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/bored_page/clock_page/death_clock_has_date.dart';
import 'package:flutter_app/views/bored_page/clock_page/death_clock_no_date.dart';
import 'package:flutter_app/views/bored_page/clock_page/share_data.dart';

class DeathClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeathPageState();
}

class DeathPageState extends State<DeathClock> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: getView(context),
    );
  }

  getView(BuildContext context) {
    if (ShareWidget.of(context).fromTime != null &&
        ShareWidget.of(context).data != null &&
        ShareWidget.of(context).deathYear != null &&
        ShareWidget.of(context).deathYear > 0) {
      return DeathClockHasDate();
    } else {
      return  DeathClockNoDate();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("DeathClock Dependencies change");
  }
}
