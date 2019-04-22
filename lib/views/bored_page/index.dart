import 'package:flutter/material.dart';
import 'package:flutter_app/model/widget.dart';
import 'package:flutter_app/views/bored_page/clock_page/clock.dart';

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: '时间管理局',
    routerName: "/bored/login",
    color: Colors.red,
    buildRouter: (BuildContext context) => ClockPage(),
  ),
  WidgetPoint(
    name: '功能1',
    routerName: "/bored/list",
    color: Colors.yellow,
    buildRouter: (BuildContext context) => null,
  ),
  WidgetPoint(
    name: '功能2',
    routerName: "",
    color: Colors.blue,
    buildRouter: (BuildContext context) => null,
  ),
  WidgetPoint(
    name: '功能3',
    routerName: "",
    color: Colors.deepPurple,
    buildRouter: (BuildContext context) => null,
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
