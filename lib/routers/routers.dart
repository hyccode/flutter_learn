import 'package:fluro/fluro.dart';
import 'package:flutter_app/routers/router_handler.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String list = "/list";

  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
    router.define(list, handler: listHandler);
  }
}