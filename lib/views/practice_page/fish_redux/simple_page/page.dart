import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SimplePagePage extends Page<SimplePageState, Map<String, dynamic>> {
  SimplePagePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SimplePageState>(
              adapter: null, slots: <String, Dependent<SimplePageState>>{}),
          middleware: <Middleware<SimplePageState>>[],
        );
}
