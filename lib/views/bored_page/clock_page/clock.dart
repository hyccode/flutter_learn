import 'package:flutter/material.dart';
import 'package:flutter_app/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockPage extends StatefulWidget {
  @override
  ClockPageState createState() => ClockPageState();
}

class ClockPageState extends State<ClockPage> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _userName = '';

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

    Future<bool> _unKnow = _prefs.then((SharedPreferences prefs) {
      return (prefs.getBool('disclaimer::Boolean') ?? false);
    });
    Future<String> _user = _prefs.then((SharedPreferences prefs) {
      return prefs.getString(SharedPreferencesKeys.UserId);
    });

    _user.then((String name) {
      new Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _userName = name;
        });
      });
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('选择你出生日期时间'),
          RaisedButton(
            child: Text(
                '你出生的日期:${_date.toString()} \n 你出生的时间:${_time.toString()}'),
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
      drawer: _drawer,
    );
  }

  get _drawer => Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(_userName),
              accountEmail: Text(_userName),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.red,
              ),
              margin: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
              title: Text("重设生日"),
            ),
            ListTile(
              onTap: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
              title: Text("重设寿命"),
            ),
          ],
        ),
      );
}
