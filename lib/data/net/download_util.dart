import 'dart:io';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/data/net/dio_util.dart';

Future download1(
  String url,
  savePath, {
  ProgressCallback onProgress,
  CancelToken cancelToken,
  data,
  Options options,
}) async {
  try {
    await DioUtil.getDio().download(
      url,
      savePath,
      onReceiveProgress: onProgress,
    );
  } catch (e) {
    LogUtil.e(e, tag: "download-error");
  }
}

///下载小文件时使用
//Another way to downloading small file
Future download2(String url, String savePath) async {
  try {
    Response response = await DioUtil.getDio().get(
      url,
      onReceiveProgress: showDownloadProgress,
      //Received data with List<int>
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
      ),
    );
    print(response.headers);
    File file = new File(savePath);
    var raf = file.openSync(mode: FileMode.write);
    // response.data is List<int> type
    raf.writeFromSync(response.data);
    await raf.close();
  } catch (e) {
    LogUtil.e(e, tag: "download-error");
  }
}

void showDownloadProgress(received, total) {
  if (total != -1) {
    LogUtil.e((received / total * 100).toStringAsFixed(0) + "%",
        tag: "download-success");
  }
}

/// Download the file and save it in local. The default http method is "GET",you can custom it by [Options.method].
/// [urlPath]: The file url.
/// [savePath]: The path to save the downloading file later.
/// [onProgress]: The callback to listen downloading progress.please refer to [OnDownloadProgress].
Future<Response> download(
  String urlPath,
  savePath, {
  ProgressCallback onProgress,
  CancelToken cancelToken,
  data,
  Options options,
}) {
  return DioUtil.getDio().download(urlPath, savePath,
      onReceiveProgress: onProgress,
      cancelToken: cancelToken,
      data: data,
      options: options);
}
