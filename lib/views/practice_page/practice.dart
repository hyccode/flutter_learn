import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/views/practice_page/index.dart' as practice;

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
                    .navigateTo(context, practice.widgetPoints[index].routerName);
              },
              title: Text(practice.widgetPoints[index].name),
            ),
            Divider(),
          ],
        );
      },
      itemCount: practice.widgetPoints.length,
    );
  }
}

