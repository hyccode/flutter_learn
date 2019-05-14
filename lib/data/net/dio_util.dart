import 'dart:convert';
import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/data/protocol/models.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/views/practice_page/net/net_dio_utils.dart';

/// 请求方法.
class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

///Http配置.
class HttpConfig {
  /// constructor.
  HttpConfig({
    this.code,
    this.msg,
    this.data,
    this.options,
  });

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String code;

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String msg;

  /// BaseResp [T data]字段 key, 默认：data.
  String data;

  /// Options.
  Options options;
}

/// 单例 DioUtil.
/// debug模式下可以打印请求日志. DioUtil.openDebug().
/// dio详细使用请查看dio官网(https://github.com/flutterchina/dio).
class DioUtil {
  static final DioUtil _singleton = DioUtil._init();
  static Dio _dio;

  /// Options.
  BaseOptions _options = getDefOptions();

  /// 是否是debug模式.
  static bool _isDebug = false;

  static DioUtil getInstance() {
    return _singleton;
  }

  //工厂构造函数(Factory constructors)
  //factory 关键字的功能，当实现构造函数但是不想每次都创建该类的一个实例的时候使用。
  factory DioUtil() {
    return _singleton;
  }

  DioUtil._init() {
    _dio = new Dio(_options);
    _dio.interceptors.add(_interceptorsWrapper);
    _dio.interceptors.add(LogInterceptor(
        responseBody: true, requestHeader: true, error: true)); //开启请求日志
  }

  /// get dio.
  Dio getDio() {
    return _dio ?? new Dio();
  }

  /// 打开debug模式.
  static void openDebug() {
    _isDebug = true;
  }

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String _error_code = "error_code";

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String _reason = "reason";

  /// BaseResp [T data]字段 key, 默认：data.
  String _result = "result";

  /// Make http request with options.
  /// [method] The request method.
  /// [path] The url path.
  /// [data] The request data
  /// [options] The request options.
  /// <BaseResp<T> 返回 status code msg data .
  Future<BaseResp<T>> request<T>(String method, String path,
      {data, Options options, CancelToken cancelToken}) async {
    Response response = await _dio.request(path,
        data: data, options: Options(method: method), cancelToken: cancelToken);
    int _code;
    String _msg;
    T _data;
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        if (response.data is Map) {
          _code = (response.data[_error_code] is String)
              ? int.tryParse(response.data[_error_code])
              : response.data[_error_code];
          _msg = response.data[_reason];
          _data = response.data[_result];
        } else {
          Map<String, dynamic> _dataMap = _decodeData(response);
          _code = (_dataMap[_error_code] is String)
              ? int.tryParse(_dataMap[_error_code])
              : _dataMap[_error_code];
          _msg = _dataMap[_reason];
          _data = _dataMap[_result];
        }
        return new BaseResp(_code, _msg, _data);
      } catch (e) {
        return new Future.error(new DioError(
          response: response,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    return new Future.error(new DioError(
      response: response,
      message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response == null ||
        response.data == null ||
        response.data.toString().isEmpty) {
      return new Map();
    }
    return json.decode(response.data.toString());
  }

  /// get Def Options.
  static BaseOptions getDefOptions() {
    BaseOptions options = new BaseOptions(
      baseUrl: "http://v.juhe.cn",
      connectTimeout: 1000 * 10,
      receiveTimeout: 1000 * 10,
    );
    return options;
  }

  //设置拦截器
  InterceptorsWrapper _interceptorsWrapper =
      InterceptorsWrapper(onRequest: (Options options) {
    return options;
  });

  //get请求结构
  Future<BaseResp<T>> _get<T>(String url, {Map<String, dynamic> params}) async {
    var response = await _dio.get(url, queryParameters: params);
    int _code;
    String _msg;
    var _data;
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        if (response.data is Map) {
          _code = (response.data[_error_code] is String)
              ? int.tryParse(response.data[_error_code])
              : response.data[_error_code];
          _msg = response.data[_reason];
          _data = response.data[_result];
        } else {
          Map<String, dynamic> _dataMap = _decodeData(response);
          _code = (_dataMap[_error_code] is String)
              ? int.tryParse(_dataMap[_error_code])
              : _dataMap[_error_code];
          _msg = _dataMap[_reason];
          _data = _dataMap[_result];
        }
        return new BaseResp(_code, _msg, EntityFactory.generateOBJ<T>(_data));
//        return new BaseResp(_code, _msg, _data);
      } catch (e) {
        LogUtil.e(e.toString(), tag: "data parsing");
        return new Future.error(new DioError(
          response: response,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    return new Future.error(new DioError(
      response: response,
      message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }

  //post
  Future _post(String url, Map<String, dynamic> params) async {
    var response = await _dio.post(url, data: params);
    return response.data;
  }

  Observable postO(String url, Map<String, dynamic> params) =>
      Observable.fromFuture(_post(url, params)).asBroadcastStream();

  Observable getO<T>(String url, {Map<String, dynamic> params}) =>
      Observable.fromFuture(_get<T>(url, params: params)).asBroadcastStream();
}
