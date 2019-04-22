import 'package:flutter/material.dart';
import 'package:flutter_app/model/widget.dart';
import 'package:flutter_app/views/login_page/login.dart';
import 'package:flutter_app/views/practice_page/listdemo_page/listdome.dart';

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: '登录页',
    routerName: "/practice/login",
    buildRouter: (BuildContext context) => LoginPage(),
  ),
  WidgetPoint(
    name: '列表',
    routerName: "/practice/list",
    buildRouter: (BuildContext context) => ListDemo(),
  ),
  WidgetPoint(
    name: '弹窗dialog',
    routerName: "",
    buildRouter: (BuildContext context) => null,
  ),
  WidgetPoint(
    name: '动画',
    routerName: "",
    buildRouter: (BuildContext context) => null,
  ),
  WidgetPoint(
    name: '轮播图',
    routerName: "",
    buildRouter: (BuildContext context) => null,
  )

];