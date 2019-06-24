import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SimplePageState> buildReducer() {
  println('Reducer:buildReducer');

  return asReducer(
    <Object, Reducer<SimplePageState>>{
      SimplePageAction.update: _update,
    },
  );
}



SimplePageState _update(SimplePageState state, Action action) {
  println('Reducer: _update');
  final Map<String, String> update = action.payload ?? <String, String>{};
  final SimplePageState newState = state.clone();
  newState.title = update['title'] ?? newState.title;
  newState.content = update['content'] ?? newState.content;

  return newState;
}
