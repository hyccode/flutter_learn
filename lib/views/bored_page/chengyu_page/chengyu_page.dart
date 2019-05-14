import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/baseful_widget.dart';
import 'package:flutter_app/data/protocol/chengyu_entity.dart';
import 'package:flutter_app/mvp/contract/chengyu_contract.dart';
import 'package:flutter_app/mvp/presenter/chengyu_presenter.dart';
import 'package:flutter_app/views/bored_page/chengyu_page/chengyu_info.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChengYuPage extends BasefulWidget implements View {
  ChengYuPresenter chengYuPresenter;

  ChengYuPage() {
    chengYuPresenter = new ChengYuPresenter(this);
  }

  ChengyuEntity chengyuEntity;

  final TextEditingController _controller = new TextEditingController();

//   String text;

  @override
  void initState() {
    LogUtil.e("initState");
  }

  @override
  void dispose() {
    LogUtil.e("dispose");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("成语解析"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: '请输入你要查询的成语',
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: _getChengyu,
                  child: Text("搜索"),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: ChengYuInfoList(
                chengyuEntity: chengyuEntity,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _getChengyu() {
    if (_controller.text == null || _controller.text == "") {
      Fluttertoast.showToast(
          msg: "成语不能为空",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    chengYuPresenter.getChengYu(_controller.text);
  }

  @override
  void closeLoading() {
    // TODO: implement closeLoading
    LogUtil.e("closeLoading");
  }

  @override
  void reload() {
    // TODO: implement reload
    LogUtil.e("reload");
  }

  @override
  void renderPage(Object o) {
    // TODO: implement renderPage
    ChengyuEntity chengyuEntity = o as ChengyuEntity;

    LogUtil.e("success1");
    state.setState(() {
      this.chengyuEntity = chengyuEntity;
    });
  }

  @override
  void showDisconnect() {
    // TODO: implement showDisconnect
    LogUtil.e("showDisconnect");
  }

  @override
  void showError({String msg}) {
    // TODO: implement showError
    LogUtil.e("showError" + msg);
  }

  @override
  void showLoading({String msg}) {
    // TODO: implement showLoading
    LogUtil.e("showLoading");
  }
}
