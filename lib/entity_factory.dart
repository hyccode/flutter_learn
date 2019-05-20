import 'package:flutter_app/mvp/presenter/history_info_entity.dart';
import 'package:flutter_app/data/protocol/chengyu_entity.dart';
import 'package:flutter_app/data/protocol/history_list_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    } else if (T.toString() == "HistoryInfoEntity") {
      return HistoryInfoEntity.fromJson(json) as T;
    } else if (T.toString() == "ChengyuEntity") {
      return ChengyuEntity.fromJson(json) as T;
    } else if (T.toString() == "HistoryListEntity") {
      return HistoryListEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}