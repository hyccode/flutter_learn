import 'package:flutter_app/data/protocol/chengyu_entity.dart';
import 'package:flutter_app/data/repository/repository.dart';
import 'package:flutter_app/mvp/contract/chengyu_contract.dart';
import 'package:flutter_app/mvp/mvp.dart';

class ChengYuPresenter extends BasePresenter<View> implements Presenter {
  ChengYuPresenter(View view) : super(view);

  @override
  void start() {}

  @override
  void getChengYu(String text) {
    if (!isViewAttached()) {
      return;
    }
    view.showLoading();
    Repository()
        .chengYuGet("e1ea4240d072adbadfb8b793b1cad2d3", text)
        .listen((request) {
      if (!isViewAttached()) {
        return;
      }
      if (request.error_code == 0) {
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
