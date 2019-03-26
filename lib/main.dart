// ignore: uri_does_not_exist
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/routers/routers.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/utils/shared_preferences.dart';
import 'package:flutter_app/resources/shared_preferences_keys.dart';
import 'package:flutter_app/views/home_page/home.dart';
import 'package:flutter_app/views/login/login.dart';

SpUtil sp;

void main() async {
  sp = await SpUtil.getInstance();
  runApp(new MyApp());
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
