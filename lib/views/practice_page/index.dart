import 'package:flutter/material.dart';
import 'package:flutter_app/model/widget.dart';
import 'package:flutter_app/views/login_page/login.dart';
import 'package:flutter_app/views/practice_page/animal_page.dart';
import 'package:flutter_app/views/practice_page/banner_page.dart';
import 'package:flutter_app/views/practice_page/dialog_page.dart';
import 'package:flutter_app/views/practice_page/listdemo_page/listdome.dart';
import 'package:flutter_app/views/practice_page/net/network_page.dart';
import 'package:flutter_app/views/practice_page/page_indicator_page/page_indicator_page.dart';

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
    name: 'flutter go的page动画',
    routerName: "/practice/pageindicator",
    buildRouter: (BuildContext context) => PageIndicatorPage(),
  ),
  WidgetPoint(
    name: '网络请求',
    routerName: "/practice/network",
    buildRouter: (BuildContext context) => NetworkPage(),
  ),
  WidgetPoint(
    name: '弹窗dialog',
    routerName: "/practice/dialog",
    buildRouter: (BuildContext context) => DialogPage(),
  ),
  WidgetPoint(
    name: '动画',
    routerName: "/practice/animal",
    buildRouter: (BuildContext context) => AnimalPage(),
  ),
  WidgetPoint(
    name: '轮播图',
    routerName: "/practice/banner",
    buildRouter: (BuildContext context) => BannerPage(),
  )
];
