import 'package:fish_redux/fish_redux.dart';

class newsState implements Cloneable<newsState> {

  @override
  newsState clone() {
    return newsState();
  }
}

newsState initState(Map<String, dynamic> args) {
  return newsState();
}
