import 'package:flutter/material.dart';
import 'package:flutter_app/common/page_state.dart';
import 'package:flutter_app/components/list_item_history.dart';
import 'package:flutter_app/data/protocol/history_list_entity.dart';
import 'package:flutter_app/mvp/contract/history_contract.dart';
import 'package:flutter_app/mvp/presenter/history_presenter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = new DateTime.now();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("历史上的今天(${dateTime.month}月${dateTime.day}日)"),
      ),
      body: HistoryList(),
    );
  }
}

class HistoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HistoryListState();
}

class HistoryListState extends BaseLoadingListPageState<HistoryList>
    implements View {
  RefreshController _refreshController;
  HistoryPresenter historyPresenter;

  String date;

  List<HistoryListEntity> dataList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime dateTime = new DateTime.now();
    date = "${dateTime.month}/${dateTime.day}";

    historyPresenter = new HistoryPresenter(this);

    _refreshController = RefreshController();
//     如果你需要开始就请求一次刷新
//    _refreshController.requestRefresh();
  }

  void _onRefresh() {
    /*.  after the data return,
        use _refreshController.refreshComplete() or refreshFailed() to end refreshing
   */
    historyPresenter.getHistory(date);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return SmartRefresher(
      child: ListView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListViewItem(historyListEntity: dataList[index]);
        },
        itemCount: dataList == null ? 0 : dataList.length,
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    super.dispose();
    historyPresenter.stop();
  }

  @override
  void preparedPage() {
    // TODO: implement preparedPage
    _refreshController.requestRefresh();
  }

  @override
  void startRefresh() {
    // TODO: implement startRefresh
    super.startRefresh();
    _refreshController.requestRefresh();
  }

  @override
  void finishRefresh() {
    // TODO: implement finishRefresh
    super.finishRefresh();
    _refreshController.refreshCompleted();
  }

  @override
  void showData(Object o, {bool isLoadMore}) {
    setState(() {
      dataList = o;
    });
  }
}
