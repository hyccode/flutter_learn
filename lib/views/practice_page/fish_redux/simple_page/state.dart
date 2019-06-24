import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';

class SimplePageState implements Cloneable<SimplePageState> {
  String title;
  String content;

  SimplePageState({this.title, this.content});

  @override
  SimplePageState clone() {
    return SimplePageState()
      ..title = title
      ..content = content;
  }
}

SimplePageState initState(Map<String, dynamic> args) {
  LogUtil.e("state:initState");
  return SimplePageState(title: "title",content: "content");
}
