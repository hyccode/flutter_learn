import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/views/bored_page/index.dart' as bored;

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
              color: bored.widgetPoints[index].color,
              child: new Center(
                child: Text(bored.widgetPoints[index].name),
              ),
            ),
          );
        },
        itemCount: bored.widgetPoints.length,
      ),
    );
  }

  void itemClick(BuildContext context, int index) {
    Application.router.navigateTo(context, bored.widgetPoints[index].routerName);
  }
}
