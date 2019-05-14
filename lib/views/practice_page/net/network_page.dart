import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/views/practice_page/net/net_dio_utils.dart';

class NetworkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NetworkPageState();
}

class NetworkPageState extends State<NetworkPage> {
  String _text = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("网络请求"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Application.router.navigateTo(context, DioNetUtilsPage.routeName);
            },
            child: new Text("封装dio网络请求库"),
          ),
          RaisedButton(
            onPressed: () {
              getHttp();
            },
            child: new Text("简单get请求"),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(_text),
            ),
          )
        ],
      ),
    );
  }

  void getHttp() async {
    try {
      Response response = await Dio().get("http://www.baidu.com");
      setState(() {
        _text = response.data.replaceAll(RegExp(r"\s"), "");
      });
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
