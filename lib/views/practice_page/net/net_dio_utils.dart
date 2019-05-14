import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/common/baseful_widget.dart';
import 'package:flutter_app/data/protocol/chengyu_entity.dart';
import 'package:flutter_app/data/protocol/models.dart';
import 'package:flutter_app/data/repository/repository.dart';

export 'package:rxdart/rxdart.dart';

class DioNetUtilsPage extends BasefulWidget {
  static const String routeName = '/practice/network/dio';
  String _text;
  String _text1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("网络封装"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Repository()
                  .get("e1ea4240d072adbadfb8b793b1cad2d3", "一飞冲天")
                  .listen((request) {
                BaseResp b = request;
                var reason = b.reason;
                LogUtil.e("success" + reason);
                ChengyuEntity chengyuEntity =
                    ChengyuEntity.fromJson(request.result);
                state.setState(() {
                  _text = chengyuEntity.pinyin;
                });
              }, onError: (e) {
                state.setState(() {
                  _text = e.toString();
                });
                LogUtil.e("error");
              });
            },
            child: new Text("get请求"),
          ),
          Text(_text ?? "这里展示请求完的数据"),
          RaisedButton(
            onPressed: () {
              Repository()
                  .post<ChengyuEntity>(
                      "e1ea4240d072adbadfb8b793b1cad2d3", "一飞冲天")
                  .listen((request) {
                LogUtil.e("success1");

                state.setState(() {
                  _text1 = request.toString();
                });
              }, onError: (e) {
                state.setState(() {
                  _text1 = e.toString();
                });
                LogUtil.e("error1");
              });
            },
            child: new Text("post请求"),
          ),
          Text(_text1 ?? "这里展示请求完的数据"),
        ],
      ),
    );
  }
}
