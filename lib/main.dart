// ignore: uri_does_not_exist
import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/routers/routers.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/utils/shared_preferences.dart';
import 'package:flutter_app/resources/shared_preferences_keys.dart';
import 'package:flutter_app/views/home_page/home.dart';
import 'package:flutter_app/views/login_page/login.dart';
import 'package:flutter_app/common/http.dart'; // make dio as global top-level variable

SpUtil sp;

void main() async {
  sp = await SpUtil.getInstance();
  //开启log
  LogUtil.init(isDebug: true, tag: "hyc");


  dio.interceptors..add(CookieManager(CookieJar()))..add(LogInterceptor());
  (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  dio.options.connectTimeout = 10000; //10s
  dio.options.baseUrl="";
  dio.options.receiveTimeout = 15000;

  runApp(new MyApp());
}

// Must be top-level function
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "hyc_flutter",
      home: new Scaffold(body: toLogin()),
      onGenerateRoute: Application.router.generator,
    );
  }

  toLogin() {
    String string = sp.getString(SharedPreferencesKeys.UserId);
    if (string == null) {
      return new LoginPage();
    } else {
      return new HomePage();
    }
  }
}
