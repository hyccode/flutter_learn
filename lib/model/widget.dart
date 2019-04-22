import "package:flutter/material.dart";

class WidgetPoint {
  //名称
  String name;

  // 路由地址
  String routerName;

  final Color color;

  final WidgetBuilder buildRouter;

  WidgetPoint({this.name, this.routerName, this.buildRouter,this.color});
}
