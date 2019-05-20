class IView {}

class IPresenter {}

abstract class BasePresenter<T> {
  T view;

  BasePresenter(this.view);

  void start();

  void stop() {
    this.view = null;
  }

  /**
   * 是否与View建立连接
   * 每次调用业务请求的时候都要出先调用方法检查是否与View建立连接
   */
  bool isViewAttached() {
    return this.view != null;
  }
}

class ILoadingView extends IView {
  void showLoading({String msg}) {}

  void closeLoading() {}

  void renderPage(Object o) {}

  void reload() {}

  void showError({String msg}) {}

  void showDisconnect() {}
}

class ILoadingListView extends IView {
  void showError({String msg}) {}

  void showData(Object o,{bool isLoadMore}){}

  void showEmpty() {}

  void startRefresh() {}

  void finishRefresh() {}

  void startLoadMore() {}

  void finishLoadMore() {}
}
