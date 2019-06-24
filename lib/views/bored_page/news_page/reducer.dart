import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<newsState> buildReducer() {
  return asReducer(
    <Object, Reducer<newsState>>{
      newsAction.action: _onAction,
    },
  );
}

newsState _onAction(newsState state, Action action) {
  final newsState newState = state.clone();
  return newState;
}
