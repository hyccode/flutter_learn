//import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SimplePageState state, Dispatch dispatch, ViewService viewService) {
  println('view: buildView');

  return Scaffold(
    appBar: AppBar(
      title: Text(state.title),
    ),
    body: Center(child: Text(state.content)),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        dispatch(SimplePageActionCreator.update("say", "hello"));
      },
      child: Icon(Icons.edit),
    ),
  );
}
