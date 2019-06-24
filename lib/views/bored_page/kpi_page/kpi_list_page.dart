import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_orm_plugin/flutter_orm_plugin.dart';
import 'package:intl/intl.dart' as datef;

class KPIListPage extends StatelessWidget {
  static const String routeName = '/practice/kpipage/kpilist';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("打分记录"),
      ),
      body: KPIListBodyPage(),
    );
  }
}

class KPIListBodyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => KPIListBodyPageState();
}

class KPIListBodyPageState extends State<KPIListBodyPage> {
  List KpiList = new List();

  @override
  void initState() {
    super.initState();
    Query("KPIItem").all().then((List l) {
      setState(() {
        KpiList = l;
        LogUtil.e(KpiList.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Expanded(
          child: new ListView.builder(
            itemCount: KpiList.length,
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (context, i) {
              Map data = KpiList[i];
              return Dismissible(
                key: new Key(i.toString()),
                onDismissed: (direction) {
                  KpiList.removeAt(i);
                },
                background: Container(
                  color: Colors.red,
                ),
                child: GestureDetector(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getKpiLists(data),
                  ),
                ),
              );
            },
          ),
        ),
        Container(child: Text("删除所有（可左滑删除某一条）"),)
      ],
    );
  }

  _getKpiLists(Map data) {
    List<Widget> list = [];

    int date = data["date"].toInt();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    int time_jiaofu = data["time_jiaofu"].toInt();
    int time_baohe = data["time_baohe"].toInt();
    int quality_bug = data["quality_bug"].toInt();
    int quality_diff = data["quality_diff"].toInt();
    int attitude_person = data["attitude_person"].toInt();
    int attitude_team = data["attitude_team"].toInt();

    list.add(_getKpiList('日期  : ${datef.DateFormat.yMMMd().format(dateTime)}'));
    list.add(_getKpiList(
        '总分  : ${time_jiaofu + time_baohe + quality_bug + quality_diff + attitude_person + attitude_team}'));
    list.add(_getKpiList('交付时间  : $time_jiaofu'));
    list.add(_getKpiList('饱和  : $time_baohe'));
    list.add(_getKpiList('饱和  : $quality_bug'));
    list.add(_getKpiList('饱和  : $quality_diff'));
    list.add(_getKpiList('饱和  : $attitude_person'));
    list.add(_getKpiList('饱和  : $attitude_team'));
    list.add(new Divider());

    return list;
  }

  _getKpiList(String s) {
    return new Text(s, style: const TextStyle(fontSize: 15.0));
  }
}
