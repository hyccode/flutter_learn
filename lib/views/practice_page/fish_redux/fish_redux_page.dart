import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/views/practice_page/fish_redux/simple_page/page.dart';

final Map<String, String> cases = <String, String>{
  '简单使用': "/practice/fish_redux/fish_redux_list1",
};

class FishReduxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fish-redux demo"),
      ),
      body: getListView(),
    );
  }

  getListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final String name = cases.keys.toList()[index];
        final String router = cases.values.toList()[index];


        return GestureDetector(
          child: Container(
            height: 86.0,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            alignment: AlignmentDirectional.center,
            color: Colors.grey,
            child: Text(
              name,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          onTap: () {
            Application.router.navigateTo(context, router);
          },
        );
      },
      itemCount: cases.length,
    );
  }
}
