import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum newsAction { action }

class newsActionCreator {
  static Action onAction() {
    return const Action(newsAction.action);
  }
}
