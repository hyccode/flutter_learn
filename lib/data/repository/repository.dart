import 'package:flutter_app/common/common.dart';
import 'package:flutter_app/data/api/apis.dart';
import 'package:flutter_app/data/net/dio_util.dart';
import 'package:flutter_app/data/protocol/chengyu_entity.dart';
import 'package:flutter_app/data/protocol/models.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/views/practice_page/net/net_dio_utils.dart';

class Repository {
  Future<List<BannerModel>> getBanner() async {
    BaseResp<List> baseResp = await DioUtil()
        .request<List>(Method.get, Api.getPath(path: Api.BANNER));
    List<BannerModel> bannerList;
    if (baseResp.error_code != Constant.status_success) {
      return new Future.error(baseResp.reason);
    }
    if (baseResp.result != null) {
      bannerList = baseResp.result.map((value) {
        return BannerModel.fromJson(value);
      }).toList();
    }
    return bannerList;
  }

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
  Observable post<T>(String key, String word) {
    Map<String, String> map = new Map();
    map["key"] = key;
    map["word"] = word;
    return DioUtil().getO<T>("/chengyu/query", params: map);
  }

  /*
  * 获取成语解释
  * */
  Observable chengYuGet<T>(String key, String word) {
    Map<String, String> map = new Map();
    map["key"] = key;
    map["word"] = word;
    return DioUtil().getO<T>("/chengyu/query", params: map);
  }
}
