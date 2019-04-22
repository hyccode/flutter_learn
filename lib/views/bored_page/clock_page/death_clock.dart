import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeathClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeathPageState();
}

class DeathPageState extends State<DeathClock>{
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null && picked != _date)
      print("data selectied :${_date.toString()}");
    setState(() {
      _date = picked;
    });

    if (picked == null) _date = DateTime.now();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time)
      print("data selectied :${_time.toString()}");
    setState(() {
      _time = picked;
    });
    if (picked == null) _time = TimeOfDay.now();
  }

  @override
  void initState() {
    super.initState();
    print("black");
    Future<bool> _unKnow = _prefs.then((SharedPreferences prefs) {
      return (prefs.getBool('disclaimer::Boolean') ?? false);
    });

    /// 判断是否需要弹出免责声明,已经勾选过不在显示,就不会主动弹
    _unKnow.then((bool value) {
      new Future.delayed(const Duration(seconds: 1), () {
        if (!value) {
          _selectDate(context);
        }
      });
    });
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
          RaisedButton(
            child: Text(
                '你死亡的日期:${_date.toString()} \n 你死亡的时间:${_time.toString()}'),
            onPressed: () {
              _selectDate(context);
            },
          ),
          Text('时间选择'),
          RaisedButton(
            child: Text('date selected'),
            onPressed: () {
              _selectTime(context);
            },
          )
        ],
      ),
    );
  }


}
