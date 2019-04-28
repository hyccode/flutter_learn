import 'package:flutter/material.dart';
import 'package:flutter_app/views/bored_page/clock_page/clock.dart';
import 'package:flutter_app/views/bored_page/clock_page/death_clock.dart';
import 'package:flutter_app/views/bored_page/clock_page/live_clock.dart';
import 'package:flutter_app/views/bored_page/clock_page/share_data.dart';

class PageClock extends StatelessWidget {
  final PageViewClockModel viewModel;
  final double percentVisible;
  final DateTime fromDate;
  final TimeOfDay fromTime;

  PageClock({
    this.viewModel,
    this.percentVisible = 1.0,
    this.fromDate,
    this.fromTime,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Opacity(
      opacity: percentVisible,
      child: Transform(
        transform:
            Matrix4.translationValues(0.0, 50.0 * (1.0 - percentVisible), 0.0),
        child: getPage(),
      ),
    );
  }

  getPage() {
    if (viewModel.position == 1) {
      return ShareWidget(
        data: fromDate,
        fromTime: fromTime,
        child: LiveClock(),
      );
    } else if (viewModel.position == 2) {
      return DeathClock();
    }
  }
}