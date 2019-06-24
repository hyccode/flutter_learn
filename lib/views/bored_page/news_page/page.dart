import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class newsPage extends Page<newsState, Map<String, dynamic>> {
  newsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<newsState>(
                adapter: null,
                slots: <String, Dependent<newsState>>{
                }),
            middleware: <Middleware<newsState>>[
            ],);

}
