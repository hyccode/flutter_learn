import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<newsState> buildEffect() {
  return combineEffects(<Object, Effect<newsState>>{
    newsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<newsState> ctx) {
}
