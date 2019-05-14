import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/baseful_widget.dart';
import 'package:flutter_app/model/widget.dart';
import 'package:flutter_app/routers/router_handler.dart';
import 'package:flutter_app/views/index.dart';
import 'package:flutter_app/views/practice_page/net/net_dio_utils.dart';
import 'package:flutter_app/widgets/404.dart';

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
    widgetDemosList.addAll(NetWork);
    router.notFoundHandler = new Handler(
        handlerFunc:
            (BuildContext context, Map<String, List<String>> params) {});
    widgetDemosList.forEach((demo) {
      Handler handler = new Handler(handlerFunc:
          (BuildContext context, Map<String, List<String>> params) {
        if(demo.buildRouter(context)==null){
          return WidgetNotFound();
        }
        return demo.buildRouter(context);
      });
      router.define('${demo.routerName}', handler: handler);
    });

  }

}

List<WidgetPoint> NetWork = [
  WidgetPoint(
    name: '封装dio',
    routerName: DioNetUtilsPage.routeName,
    buildRouter: (BuildContext context) => DioNetUtilsPage(),
  ),
];



