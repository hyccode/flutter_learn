import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routers.dart';

class BoredPage extends StatelessWidget {
  @override
  BoredPageState build(BuildContext context) => BoredPageState();
}

class BoredPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            onTap: () {
              itemClick(context, index);
            },
            child: new Container(
              child: new Center(
                child: Text(pages[index].name),
              ),
            ),
          );
        },
        itemCount: pages.length,
      ),
    );
  }

  void itemClick(BuildContext context, int index) {
    Application.router.navigateTo(context, pages[index].path);
  }
}

final pages = [
  FunctionBean("生死时钟", Routes.clock),
  FunctionBean("不知道", ""),
  FunctionBean("不知道", ""),
  FunctionBean("不知道", ""),
  FunctionBean("不知道", ""),
  FunctionBean("不知道", ""),
];

class FunctionBean {
  final String name;
  final String path;

  FunctionBean(this.name, this.path);
}
