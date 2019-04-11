import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routers.dart';

class PracticePage extends StatelessWidget {

  @override
  Widget build(BuildContext context)  => PracticePageState();
}

class PracticePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        return new Column(
          children: <Widget>[
            ListTile(
              onTap: () {
                Application.router
                    .navigateTo(context, practiceList[index].path);
              },
              title: Text(practiceList[index].name),
            ),
            Divider(),
          ],
        );
      },
      itemCount: practiceList.length,
    );
  }
}

final practiceList = [
  FunctionBean("登录页", Routes.login),
  FunctionBean("列表", Routes.list),
  FunctionBean("弹窗dialog", ""),
  FunctionBean("动画", ""),
  FunctionBean("轮播图", ""),
  FunctionBean("轮播图", ""),
  FunctionBean("轮播图", ""),
  FunctionBean("轮播图", ""),
];

class FunctionBean {
  final String name;
  final String path;

  FunctionBean(this.name, this.path);
}
