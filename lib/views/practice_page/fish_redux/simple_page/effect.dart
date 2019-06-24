import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SimplePageState> buildEffect() {
  println('Reducer:buildEffect');

  return combineEffects(<Object, Effect<SimplePageState>>{
    SimplePageAction.update: _onAction,
  });
}

void _onAction(Action action, Context<SimplePageState> ctx) {}

