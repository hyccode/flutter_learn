/// @Author: 一凨
/// @Date: 2019-01-14 17:53:54
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 17:57:51

import 'package:flutter/material.dart';
import 'package:flutter_app/data/protocol/history_list_entity.dart';
import 'package:flutter_app/mvp/presenter/history_info_entity.dart';
import 'package:flutter_app/widgets/progress_widget.dart';
import '../routers/application.dart';
import '../routers/routers.dart';
import 'dart:core';
import 'package:cached_network_image/cached_network_image.dart';

class ListViewImg extends StatelessWidget {
  final HistoryInfoPicurl historyInfoPicurl;

  const ListViewImg({Key key, this.historyInfoPicurl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new CachedNetworkImage(
          imageUrl: historyInfoPicurl.url??"",
          placeholder: (context, url) => new ProgressView(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
        Padding(
          child: Text(
            historyInfoPicurl.picTitle??"",
            style: TextStyle(color: Colors.black, fontSize: 11.0),
          ),
          padding: EdgeInsets.only(top: 5.0),
        ),
      ],
    );
  }
}
