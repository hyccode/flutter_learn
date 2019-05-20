import 'package:flutter/material.dart';
import 'package:flutter_app/model/widget.dart';
import 'package:flutter_app/views/bored_page/chengyu_page/chengyu_page.dart';
import 'package:flutter_app/views/bored_page/clock_page/clock.dart';
import 'package:flutter_app/views/bored_page/history_page/history_page.dart';
import 'package:flutter_app/views/bored_page/kpi_page/kpi_page.dart';

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: '时间管理局',
    routerName: "/bored/login",
    color: Colors.red,
    buildRouter: (BuildContext context) => ClockPage(),
  ),
  WidgetPoint(
    name: '成语解析',
    routerName: "/bored/chengYu",
    color: Colors.yellow,
    buildRouter: (BuildContext context) => ChengYuPage(),
  ),
  WidgetPoint(
    name: '历史上的今天',
    routerName: "/bored/history",
    color: Colors.blue,
    buildRouter: (BuildContext context) => HistoryPage(),
  ),
  WidgetPoint(
    name: '考核打分',
    routerName: "/bored/kpi",
    color: Colors.deepPurple,
    buildRouter: (BuildContext context) => KPIPage(),
  ),
  WidgetPoint(
    name: '功能4',
    routerName: "",
    color: Colors.lightBlue,
    buildRouter: (BuildContext context) => null,
  ),
  WidgetPoint(
    name: '功能5',
    routerName: "",
    color: Colors.green,
    buildRouter: (BuildContext context) => null,
  )
];
