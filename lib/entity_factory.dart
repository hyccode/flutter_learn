import 'package:common_utils/common_utils.dart';
import 'package:flutter_app/data/protocol/chengyu_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ChengyuEntity") {
      LogUtil.e("jso");
      return ChengyuEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}