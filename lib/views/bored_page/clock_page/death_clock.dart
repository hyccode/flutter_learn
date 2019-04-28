import 'package:flutter/material.dart';
import 'package:flutter_app/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeathClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeathPageState();
}

class DeathPageState extends State<DeathClock> {
  int deathYear = 0;

  @override
  void initState() {
    super.initState();
    getDeathYear();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('选择你死亡日期时间'),
        ],
      ),
    );
  }

  getDeathYear() async {
    SpUtil instance = await SpUtil.getInstance();
    deathYear = instance.getInt(SharedPreferencesKeys.death_year);
  }
}
