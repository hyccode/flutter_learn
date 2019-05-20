import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/net/download_util.dart' as download;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:path_provider/path_provider.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  String _markdownData;
  double _progress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readReadMe();
  }

  // 读取 readme 数据
  readReadMe() async {
    try {
      final file = await localFile(await localPath());
      String str = await file.readAsString();
      setState(() {
        _markdownData = str;
      });
    } catch (err) {
      print(err);
    }
  }

  localPath() async {
    try {
      var appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      return appDocPath;
    } catch (err) {
      print(err);
    }
  }

  localFile(path) async {
    return new File('$path/readme.md');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: Markdown(
            data: _markdownData ?? "",
          ),
        ),
        Stack(
          children: <Widget>[
            SizedBox(
              height: 50.0,
              child: LinearProgressIndicator(
                value: _progress ?? 0,
              ),
            ),
            GestureDetector(
                onTap: () {
                  _download();
                },
                child: SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Container(
                      child: Text("点击更新"),
                    ),
                  ),
                )),
          ],
        )
      ],
    ));
  }

  _download() async {
    LogUtil.e("downloading");
    String dir = (await getApplicationDocumentsDirectory()).path;
    await download.download1(
        "https://raw.githubusercontent.com/hyccode/flutter_learn/master/README.md",
        (HttpHeaders headers) => '$dir/readme.md',
        onProgress: showDownloadProgress);
  }

  void showDownloadProgress(received, total) {
    LogUtil.e(total.toString());
    if (total != -1) {
      LogUtil.e((received / total * 100).toStringAsFixed(0) + "%",
          tag: "download-success");
      setState(() {
        _progress = received / total;
      });
    }
  }
}
