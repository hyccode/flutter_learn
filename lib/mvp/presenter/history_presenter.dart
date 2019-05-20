import 'package:flutter_app/common/common.dart';
import 'package:flutter_app/data/repository/repository.dart';
import 'package:flutter_app/mvp/contract/history_contract.dart';
import 'package:flutter_app/mvp/mvp.dart';

class HistoryPresenter extends BasePresenter implements Presenter {
  HistoryPresenter(view) : super(view);

  @override
  void start() {}

  /**
   * 请求历史列表
   */
  @override
  void getHistory(String text) {
    if (!isViewAttached()) {
      return;
    }
    view.startRefresh();
    Repository().history(text).listen((request) {
      if (!isViewAttached()) {
        return;
      }
      if (request.error_code == Constant.status_success) {
        view.showData(request.result);
      } else {
        view.showError(msg: request.reason);
      }
    }, onError: (e) {
      if (!isViewAttached()) {
        return;
      }
      view.showError(msg: e.toString());
    }, onDone: () {
      if (!isViewAttached()) {
        return;
      }
      view.finishRefresh();
    });
  }
  /**
   * 请求历史详情页
   */
  @override
  void getHistoryInfo(String id) {
    if (!isViewAttached()) {
      return;
    }
    view.showLoading();
    Repository().historyInfo(id).listen((request) {
      if (!isViewAttached()) {
        return;
      }
      if (request.error_code == Constant.status_success) {
        view.renderPage(request.result);
      } else {
        view.showError(msg: request.reason);
      }
    }, onError: (e) {
      if (!isViewAttached()) {
        return;
      }
      view.showError(msg: e.toString());
    }, onDone: () {
      if (!isViewAttached()) {
        return;
      }
      view.closeLoading();
    });
  }
}
