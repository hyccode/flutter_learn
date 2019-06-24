import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views/bored_page/clock_page/clock.dart';
import 'package:flutter_app/views/bored_page/history_page/history_info_page.dart';
import 'package:flutter_app/views/home_page/home.dart';
import 'package:flutter_app/views/login_page/login.dart';
import 'package:flutter_app/views/practice_page/fish_redux/simple_page/page.dart';
import 'package:flutter_app/views/practice_page/listdemo_page/listdome.dart';
import 'package:flutter_app/views/webview_page.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
  },
);

// 登录界面
var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new LoginApp();
  },
);

var webViewPageHander = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage(url, title);
});

var historyInfoPageHander = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['id']?.first;
  return new HistoryInfoPage(url, title);
});
var FishReduxEmpytPageHander = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SimplePagePage().buildPage(null);
});
