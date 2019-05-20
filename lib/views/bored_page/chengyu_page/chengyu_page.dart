import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/page_state.dart';
import 'package:flutter_app/data/protocol/chengyu_entity.dart';
import 'package:flutter_app/mvp/contract/chengyu_contract.dart';
import 'package:flutter_app/mvp/presenter/chengyu_presenter.dart';
import 'package:flutter_app/utils/toast_utils.dart';
import 'package:flutter_app/views/bored_page/chengyu_page/chengyu_info.dart';

class ChengYuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChengYuStatePage();
}

class ChengYuStatePage extends BaseLoadingPageState<ChengYuPage>
    implements View {
  ChengYuPresenter chengYuPresenter;

  ChengYuStatePage() {
    chengYuPresenter = new ChengYuPresenter(this);
  }

  ChengyuEntity chengyuEntity;
  String _message;

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                noticeMessage: _message,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _getChengyu() {
    if (_controller.text == null || _controller.text == "") {
      ToastUtils.show("查询不能为空");
      return;
    }
    chengYuPresenter.getChengYu(_controller.text);
  }

  @override
  void showError({String msg}) {
    if (msg != null) {
      setState(() {
        _message = msg;
      });
    }
  }

  @override
  void renderPage(Object o) {
    // TODO: implement renderPage
    ChengyuEntity chengyuEntity = o as ChengyuEntity;

    LogUtil.e("success1");
    setState(() {
      this.chengyuEntity = chengyuEntity;
    });
  }

  @override
  void preparedPage() {
    // TODO: implement preparedPage
  }

  @override
  void dispose() {
    super.dispose();
    chengYuPresenter.stop();
  }
}
