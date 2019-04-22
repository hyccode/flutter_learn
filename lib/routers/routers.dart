import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/router_handler.dart';
import 'package:flutter_app/views/index.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String webViewPage = "/webviewpage";
  static String login = "/login";

  static void configureRoutes(Router router) {
    router.define(login, handler: loginHandler);
    router.define(home, handler: homeHandler);
    router.define(webViewPage, handler: webViewPageHander);

    List widgetDemosList = new PageList().getDemos();
    router.notFoundHandler = new Handler(
        handlerFunc:
            (BuildContext context, Map<String, List<String>> params) {});
    widgetDemosList.forEach((demo) {
      Handler handler = new Handler(handlerFunc:
          (BuildContext context, Map<String, List<String>> params) {
        return demo.buildRouter(context);
      });
      router.define('${demo.routerName}', handler: handler);
    });
  }
}
