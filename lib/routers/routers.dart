import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/widget.dart';
import 'package:flutter_app/routers/router_handler.dart';
import 'package:flutter_app/views/bored_page/kpi_page/kpi_list_page.dart';
import 'package:flutter_app/views/index.dart';
import 'package:flutter_app/views/practice_page/net/net_dio_utils.dart';
import 'package:flutter_app/widgets/404.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String webViewPage = "/webviewpage";
  static String login = "/login";
  static String historyinfo = "/bored/history/info";

  static String fish_redux_empty = "/practice/fish_redux/fish_redux_list1";

  static void configureRoutes(Router router) {
    router.define(login, handler: loginHandler);
    router.define(home, handler: homeHandler);
    router.define(webViewPage, handler: webViewPageHander);
    router.define(historyinfo, handler: historyInfoPageHander);
    router.define(fish_redux_empty, handler: FishReduxEmpytPageHander);

    List widgetDemosList = new PageList().getDemos();
    widgetDemosList.addAll(NetWork);
    router.notFoundHandler = new Handler(
        handlerFunc:
            (BuildContext context, Map<String, List<String>> params) {});
    widgetDemosList.forEach((demo) {
      Handler handler = new Handler(handlerFunc:
          (BuildContext context, Map<String, List<String>> params) {
        if (demo.buildRouter(context) == null) {
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
  WidgetPoint(
    name: '打分记录',
    routerName: KPIListPage.routeName,
    buildRouter: (BuildContext context) => KPIListPage(),
  ),
//  WidgetPoint(
//    name: 'fish_redux_list1',
//    routerName: "/practice/fish_redux/fish_redux_list1",
//    buildRouter: (BuildContext context) => SimplePagePage().buildPage(null),
//  ),
];
