import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/common/baseful_widget.dart';
import 'package:flutter_app/views/practice_page/net/net_dio_utils.dart';
export 'package:rxdart/rxdart.dart';

class DioNetUtilsPage extends BasefulWidget {
  static const String routeName = '/practice/network/dio';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("网络封装"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(onPressed: (){
            Observable.just(1)
                .delay(new Duration(milliseconds: 500))
                .listen((_) {
//              var banner = Repository.getBanner();
            });
          })
        ],
      ),
    );
  }
}
