import 'package:flutter/material.dart';

class BoredPage extends StatefulWidget {
  @override
  BoredPageState createState() => BoredPageState();
}

class BoredPageState extends State<BoredPage> {

  List functionList=new List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("无聊的功能"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Center(
                    child: Text("生命钟"),
                  ),
                  Center(
                    child: Text("2"),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Center(
                    child: Text("生命钟"),
                  ),
                  Center(
                    child: Text("2"),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Center(
                    child: Text("生命钟"),
                  ),
                  Center(
                    child: Text("2"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
