import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SimplePageAction {  update }

class SimplePageActionCreator {

  static Action update(String title, String content) {
    println('action:update');

    return Action(
      SimplePageAction.update,
      payload: <String, String>{'title': title, 'content': content},
    );
  }
}
