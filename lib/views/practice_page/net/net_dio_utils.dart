import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/common/baseful_widget.dart';
import 'package:flutter_app/data/net/download_util.dart' as download;
import 'package:flutter_app/data/protocol/chengyu_entity.dart';
import 'package:flutter_app/data/protocol/models.dart';
import 'package:flutter_app/data/repository/repository.dart';
import 'package:path_provider/path_provider.dart';

export 'package:rxdart/rxdart.dart';

class DioNetUtilsPage extends BasefulWidget {
  static const String routeName = '/practice/network/dio';
  String _text;
  String _text1;
  double _progress;

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
              get();
            },
            child: new Text("get请求"),
          ),
          Text(_text ?? "这里展示请求完的数据"),
          RaisedButton(
            onPressed: () {
              post();
            },
            child: new Text("post请求"),
          ),
          Text(_text1 ?? "这里展示请求完的数据"),
          RaisedButton(
            onPressed: () {
              _download();
            },
            child: new Text("下载"),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: LinearProgressIndicator(
                  value: _progress ?? 0,
                ),
              ),
              Text(((_progress ?? 0) * 100).toStringAsFixed(0) + "%"),
            ],
          ),
          RaisedButton(
            onPressed: () {
              _download1();
            },
            child: new Text("下载readme"),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: LinearProgressIndicator(
                  value: _progress ?? 0,
                ),
              ),
              Text(((_progress ?? 0) * 100).toStringAsFixed(0) + "%"),
            ],
          )
//          Text(_text1 ?? "这里展示请求完的数据"),
        ],
      ),
    );
  }

  ///get请求
  void get() {
    Repository().get("e1ea4240d072adbadfb8b793b1cad2d3", "一飞冲天").listen(
        (request) {
      BaseResp b = request;
      var reason = b.reason;
      LogUtil.e("success" + reason);
      ChengyuEntity chengyuEntity = ChengyuEntity.fromJson(request.result);
      state.setState(() {
        _text = chengyuEntity.pinyin;
      });
    }, onError: (e) {
      state.setState(() {
        _text = e.toString();
      });
      LogUtil.e("error");
    });
  }

  ///post请求
  void post() {
    Repository().chengYupost("e1ea4240d072adbadfb8b793b1cad2d3", "一飞冲天").listen(
        (request) {
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
  }

  _download() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    await download.download1(
        "https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action@1.0/docs/imgs/book.jpg",
        (HttpHeaders headers) => '$dir/book.jpg',
        onProgress: showDownloadProgress);
//           '$dir/book.jpg');
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      LogUtil.e((received / total * 100).toStringAsFixed(0) + "%",
          tag: "download-success");
      state.setState(() {
        _progress = received / total;
      });
    }
  }

  _download1() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    await download.download1(
        "https://raw.githubusercontent.com/hyccode/flutter_learn/master/README.md",
        (HttpHeaders headers) => '$dir/readme.md',
        onProgress: showDownloadProgress);
//           '$dir/book.jpg');
  }
}
