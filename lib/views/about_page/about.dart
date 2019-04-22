import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routers.dart';

class AboutPage extends StatelessWidget {
  @override
  AboutPageState build(BuildContext context) => AboutPageState();
}

class AboutPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: const Text("点击"),
              onPressed: () {
                Application.router.navigateTo(context,
                    '${Routes.webViewPage}?title=${Uri.encodeComponent("关于无聊")} Doc&&url=${Uri.encodeComponent("https://github.com/hyccode/flutter_learn")}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
