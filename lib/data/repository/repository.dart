import 'package:common_utils/common_utils.dart';
import 'package:flutter_app/common/common.dart';
import 'package:flutter_app/data/net/dio_util.dart';
import 'package:flutter_app/common/common.dart';
import 'package:flutter_app/data/protocol/chengyu_entity.dart';
import 'package:flutter_app/data/protocol/history_list_entity.dart';
import 'package:flutter_app/data/protocol/models.dart';
import 'package:flutter_app/mvp/presenter/history_info_entity.dart';
import 'package:flutter_app/views/bored_page/history_page/history_page.dart';
import 'package:flutter_app/views/practice_page/net/net_dio_utils.dart';

class Repository {
//  Future<List<BannerModel>> getBanner() async {
//    BaseResp<List> baseResp = await DioUtil()
//        .request<List>(Method.get, Api.getPath(path: Api.BANNER));
//    List<BannerModel> bannerList;
//    if (baseResp.error_code != Constant.status_success) {
//      return new Future.error(baseResp.reason);
//    }
//    if (baseResp.result != null) {
//      bannerList = baseResp.result.map((value) {
//        return BannerModel.fromJson(value);
//      }).toList();
//    }
//    return bannerList;
//  }

  /*
  * 获取成语解释
  * */
  Observable get(String key, String word) {
    Map<String, String> map = new Map();
    map["key"] = key;
    map["word"] = word;
    return DioUtil().getO("/chengyu/query", params: map);
  }

  /*
  * 获取成语解释
  * */
  Observable chengYupost(String key, String word) {
    Map<String, String> map = new Map();
    map["key"] = key;
    map["word"] = word;
    return DioUtil().getO<Map<String, dynamic>, ChengyuEntity>("/chengyu/query",
        params: map);
  }

  /*
  * 获取成语解释
  * */
  Observable chengYuGet(String key, String word) {
    Map<String, String> map = new Map();
    map["key"] = key;
    map["word"] = word;
    return DioUtil().getO<Map<String, dynamic>, ChengyuEntity>("/chengyu/query",
        params: map);
  }

  /*
  * 获取历史上的今天
  * */
  Observable history(String word) {
    Map<String, String> map = new Map();
    map["key"] = Constant.history_key;
    map["date"] = word;
    return DioUtil().getO<List, HistoryListEntity>(
        "http://v.juhe.cn/todayOnhistory/queryEvent.php",
        params: map);
  }

  /*
  * 获取历史上的今天
  * */
  Observable historyInfo(String id) {
    Map<String, String> map = new Map();
    map["key"] = Constant.history_key;
    map["e_id"] = id;
    return DioUtil().getO<List, HistoryInfoEntity>(
        "http://v.juhe.cn/todayOnhistory/queryDetail.php",
        params: map);
  }
}
