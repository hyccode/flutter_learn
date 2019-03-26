import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views/home_page/home.dart';
import 'package:flutter_app/views/listdemo_page/listdome.dart';


// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
  },
);

// listdemo
var listHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new ListDemo();
  },
);