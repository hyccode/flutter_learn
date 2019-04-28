import 'package:flutter/material.dart';

class NetworkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NetworkPageState();
}

class NetworkPageState extends State<NetworkPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("网络请求"),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
