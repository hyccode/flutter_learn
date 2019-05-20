import 'package:flutter/material.dart';
import 'package:flutter_app/common/page_state.dart';
import 'package:flutter_app/components/list_item_img.dart';
import 'package:flutter_app/mvp/mvp.dart';
import 'package:flutter_app/mvp/presenter/history_info_entity.dart';
import 'package:flutter_app/mvp/presenter/history_presenter.dart';
import 'package:flutter_app/widgets/progress_widget.dart';

class HistoryInfoPage extends StatelessWidget {
  final String id;
  final String title;

  HistoryInfoPage(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = new DateTime.now();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("历史上的今天(${dateTime.month}月${dateTime.day}日)"),
      ),
      body: HistoryBodyInfoPage(id),
    );
  }
}

class HistoryBodyInfoPage extends StatefulWidget {
  HistoryBodyInfoPage(this.id);

  final String id;

  @override
  State<StatefulWidget> createState() => HistoryBodyInfoPageState();
}

class HistoryBodyInfoPageState extends BaseLoadingPageState<HistoryBodyInfoPage>
    implements ILoadingView {
  HistoryPresenter historyPresenter;
  List<HistoryInfoEntity> historyInfoEntity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    historyPresenter = new HistoryPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    if (historyInfoEntity == null) {
      return ProgressView();
    } else {
      return HistoryInfoBody(historyInfoEntity: historyInfoEntity);
    }
  }

  @override
  void preparedPage() {
    // TODO: implement preparedPage
    historyPresenter.getHistoryInfo(widget.id);
  }

  @override
  void renderPage(Object o) {
    setState(() {
      historyInfoEntity = o;
    });
  }

  @override
  void showLoading({String msg}) {}

  @override
  void closeLoading({String msg}) {}
}

class HistoryInfoBody extends StatelessWidget {
  List<HistoryInfoEntity> historyInfoEntity;

  HistoryInfoBody({Key key, this.historyInfoEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (historyInfoEntity == null || historyInfoEntity.length <= 0) {
      return Text("没有数据");
    } else {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                historyInfoEntity[0].title,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  historyInfoEntity[0].content,
                  style: TextStyle(color: Colors.black54, fontSize: 16.0),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                itemCount: historyInfoEntity[0].picUrl == null
                    ? 0
                    : historyInfoEntity[0].picUrl.length,
                itemBuilder: (context, index) {
                  return ListViewImg(
                      historyInfoPicurl: historyInfoEntity[0].picUrl[index]);
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
