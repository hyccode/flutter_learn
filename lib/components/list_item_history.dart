/// @Author: 一凨
/// @Date: 2019-01-14 17:53:54
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 17:57:51

import 'package:flutter/material.dart';
import 'package:flutter_app/data/protocol/history_list_entity.dart';
import '../routers/application.dart';
import '../routers/routers.dart';
import 'dart:core';


class ListViewItem extends StatelessWidget {
  final HistoryListEntity historyListEntity;

  const ListViewItem({Key key, this.historyListEntity})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        onTap: () {
          Application.router.navigateTo(context,'${Routes.historyinfo}?title=${Uri.encodeComponent(historyListEntity.title)}&&id=${Uri.encodeComponent(historyListEntity.eId)}');
        },
        title: Padding(
          child: Text(
            historyListEntity.title,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          padding: EdgeInsets.only(top: 10.0),
        ),
        subtitle: Row(
          children: <Widget>[
            Padding(
              child: Text(historyListEntity.date,
                  style: TextStyle(color: Colors.black54, fontSize: 10.0)),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            )
          ],
        ),
        trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
      ),
    );
  }
}
