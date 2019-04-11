import 'package:fluro/fluro.dart';
import 'package:flutter_app/routers/router_handler.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String list = "/list";
  static String webViewPage = "/webviewpage";
  static String clock = "/clock";

  static String login="/login";

  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
    router.define(list, handler: listHandler);
    router.define(webViewPage, handler: webViewPageHander);
    router.define(clock, handler: clockHandler);
    router.define(login, handler: loginHandler);
  }
}
