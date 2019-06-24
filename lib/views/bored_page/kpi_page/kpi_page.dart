import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/views/bored_page/kpi_page/dialog_page.dart';
import 'package:flutter_app/views/bored_page/kpi_page/kpi_list_page.dart';
import 'package:flutter_app/views/bored_page/kpi_page/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_orm_plugin/flutter_orm_plugin.dart';

const List _topList = ["效率", "质量", "态度"];

List dialogList = [
  _time,
  _quality,
  _attitude,
];

List<DialogBean> _time = [
  DialogBean(
    title: "需求交付周期",
    list: _timeList1,
    type: 0,
  ),
  DialogBean(
    title: "需求工作量饱和度",
    list: _timeList2,
    type: 1,
  )
];

List<DialogBean> _quality = [
  DialogBean(
    title: "需求缺陷数",
    list: _qualityList1,
    type: 2,
  ),
  DialogBean(
    title: "需求复杂难度",
    list: _qualityList2,
    type: 3,
  )
];

List<DialogBean> _attitude = [
  DialogBean(
    title: "责任心、主动性",
    list: _attitudeList1,
    type: 4,
  ),
  DialogBean(
    title: "沟通协作、团队配合",
    list: _attitudeList2,
    type: 5,
  )
];

List<DialogItemBean> _timeList1 = [
  DialogItemBean(title: "高质量快速完成需求。", fenshu_start: 16, fenshu_end: 20),
  DialogItemBean(title: "按规定时间内完成任务投产上线。", fenshu_start: 8, fenshu_end: 15),
  DialogItemBean(title: "不能在规定时间内完成，影响需求投产。", fenshu_start: 0, fenshu_end: 7),
];

List<DialogItemBean> _timeList2 = [
  DialogItemBean(title: "工作饱和度高，多需求并行推进。", fenshu_start: 16, fenshu_end: 20),
  DialogItemBean(title: "工作充实，有条不紊推进。", fenshu_start: 8, fenshu_end: 15),
  DialogItemBean(title: "工作不饱和，空闲时间多。", fenshu_start: 0, fenshu_end: 7),
];

List<DialogItemBean> _qualityList1 = [
  DialogItemBean(
      title: "工作质量高，缺陷数量少、线上反馈问题少", fenshu_start: 20, fenshu_end: 25),
  DialogItemBean(
      title: "工作质量正常，缺陷数量中等，需求进度正常、线上反馈问题较多", fenshu_start: 8, fenshu_end: 19),
  DialogItemBean(
      title: "工作质量一般，产生较为严重的缺陷，严重影响进度。线上问题较多，产生严重的事故",
      fenshu_start: 0,
      fenshu_end: 7),
];
List<DialogItemBean> _qualityList2 = [
  DialogItemBean(title: "需求复杂度高，周期时间长", fenshu_start: 11, fenshu_end: 15),
  DialogItemBean(title: "需求复杂度中等，时间周期均等。", fenshu_start: 6, fenshu_end: 10),
  DialogItemBean(title: "需求复杂度中等，时间周期均等。", fenshu_start: 0, fenshu_end: 5),
];
List<DialogItemBean> _attitudeList1 = [
  DialogItemBean(
      title: "主动思考，认真负责每一个需求，积极反馈问题", fenshu_start: 8, fenshu_end: 10),
  DialogItemBean(title: "尽到自己本职工作，对工作有热情", fenshu_start: 4, fenshu_end: 7),
  DialogItemBean(
      title: "对本职工作毫无责任感，积极性不高，遇到问题不主动反馈问", fenshu_start: 1, fenshu_end: 3),
];
List<DialogItemBean> _attitudeList2 = [
  DialogItemBean(
      title: "积极配合部门协作，积极对接任务需求，帮助伙伴解决问题", fenshu_start: 8, fenshu_end: 10),
  DialogItemBean(
      title: "尽职配合部门协作工作，团队沟通较少，被动接受", fenshu_start: 4, fenshu_end: 7),
  DialogItemBean(
      title: "没有团队意识，欠缺沟通，不主动对接跟进任务", fenshu_start: 1, fenshu_end: 3),
];
const String _data = """
## 效率（40）

### 需求交付周期（20）
    1、高质量快速完成需求。(16-20)
    2、按规定时间内完成任务投产上线。(8-15)
    3、不能在规定时间内完成，影响需求投产。(0-7)

### 需求工作量饱和度（20）
    1、工作饱和度高，多需求并行推进。(16-20)
    2、工作充实，有条不紊推进。(8-15)
    3、工作不饱和，空闲时间多。(0-7)

## 质量（40）

### 需求缺陷数（25）
    1、工作质量高，缺陷数量少、线上反馈问题少（20-25）
    2、工作质量正常，缺陷数量中等，需求进度正常、线上反馈问题较多（8-19）
    3、工作质量一般，产生较为严重的缺陷，严重影响进度。线上问题较多，产生严重的事故（0-7）

### 需求复杂难度（15）
    1、需求复杂度高，周期时间长。（11-15）
    2、需求复杂度中等，时间周期均等。（6-10）
    3、复杂度较低，周期时间一般。（0-5）

## 态度（20）

### 责任心、主动性（10）
    1、主动思考，认真负责每一个需求，积极反馈问题（8-10）
    2、尽到自己本职工作，对工作有热情（4-7）
    3、对本职工作毫无责任感，积极性不高，遇到问题不主动反馈问（1-3）

### 沟通协作、团队配合（10）
    1、积极配合部门协作，积极对接任务需求，帮助伙伴解决问题（8-10）
    2、尽职配合部门协作工作，团队沟通较少，被动接受（4-7）
    3、没有团队意识，欠缺沟通，不主动对接跟进任务（1-3）
""";

class KPIPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("考核打分"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.library_books),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      children: <Widget>[
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.9,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.9,
                          child: Markdown(
                            data: _data,
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: () {
              Application.router.navigateTo(context, KPIListPage.routeName);
            },
          ),
        ],
      ),
      body: KPIPageBody(),
    );
  }
}

class KPIPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => KPIPageBodyState();
}

class KPIPageBodyState extends State<KPIPageBody> {
  KPIItemBean kpiItemBean;
  DateTime dateTime = new DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kpiItemBean = new KPIItemBean();

    // this.time_jiaofu = 0,
    //    this.time_baohe = 0,
    //    this.quality_bug = 0,
    //    this.quality_diff = 0,
    //    this.attitude_person = 0,
    //    this.attitude_team = 0,
    Map<String, Field> fields = new Map<String, Field>();
    fields["KpiId"] =
        Field(FieldType.Integer, primaryKey: true, autoIncrement: true);
    fields["date"] = Field(FieldType.Integer);
    fields["time_jiaofu"] = Field(FieldType.Integer);
    fields["time_baohe"] = Field(FieldType.Integer);
    fields["quality_bug"] = Field(FieldType.Integer);
    fields["quality_diff"] = Field(FieldType.Integer);
    fields["attitude_person"] = Field(FieldType.Integer);
    fields["attitude_team"] = Field(FieldType.Integer);

    FlutterOrmPlugin.createTable("Kpi", "KPIItem", fields);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              getFirstItem(0, kpiItemBean.count_time),
              getFirstItem(1, kpiItemBean.count_quality),
              getFirstItem(2, kpiItemBean.count_attitude),
            ],
          ),
        ),
        Container(
          padding:
          const EdgeInsets.only(left: 20, top: 5.0, right: 20, bottom: 5),
          color: Colors.black12,
          child: Row(
            children: <Widget>[
              Expanded(child: Text("总分${kpiItemBean.count_all}")),
              RaisedButton(
                onPressed: () {
                  _saveData(context);
                },
                child: Text("保存"),
              )
            ],
          ),
        ),
      ],
    );
  }

  showFenshuDialog(DialogBean listleft) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MySimpLeDialog(
            listleft,
                (value) {
              listleft.selectValue = value;
            },
                (value) {
              setState(() {
                setFenshu(listleft, value);
              });
            },
          );
        });
  }

  getTopView(int type, int count_time) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _topList[type],
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          Text(
            "$count_time",
            style: TextStyle(color: Colors.black, fontSize: 25.0),
          ),
        ],
      ),
    );
  }

  getBottom(DialogBean listleft, DialogBean listRight) {
    return Row(
      children: <Widget>[
        getViewItem(listleft),
        getViewItem(listRight),
      ],
    );
  }

  getViewItem(DialogBean listleft) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            listleft.title,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          RaisedButton(
            onPressed: () {
              showFenshuDialog(listleft);
            },
//            child: Text("${listleft.value}"),
            child: Text("${getFenshu(listleft)}"),
          ),
        ],
      ),
    );
  }

  /**
   *  每一种分数
   */
  getFirstItem(int type, int count_time) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          getTopView(type, count_time),
          getBottom(dialogList[type][0], dialogList[type][1]),
        ],
      ),
    );
  }

  setFenshu(DialogBean listleft, int index) {
//    listleft.value = index;
    switch (listleft.type) {
      case 0:
        kpiItemBean.time_jiaofu = index;
        break;
      case 1:
        kpiItemBean.time_baohe = index;
        break;
      case 2:
        kpiItemBean.quality_diff = index;
        break;
      case 3:
        kpiItemBean.quality_bug = index;
        break;
      case 4:
        kpiItemBean.attitude_team = index;
        break;
      case 5:
        kpiItemBean.attitude_person = index;
        break;
    }
  }

  int getFenshu(DialogBean listleft) {
    switch (listleft.type) {
      case 0:
        return kpiItemBean.time_jiaofu;
      case 1:
        return kpiItemBean.time_baohe;
        break;
      case 2:
        return kpiItemBean.quality_diff;
        break;
      case 3:
        return kpiItemBean.quality_bug;
        break;
      case 4:
        return kpiItemBean.attitude_team;
        break;
      case 5:
        return kpiItemBean.attitude_person;
        break;
    }
  }

  _saveData(BuildContext context) {
    //这个和Android的SnackBar差不多
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("保存成功")));
    LogUtil.e("save");
    DateTime dateTime = DateTime.now();
    int millisecondsSinceEpoch = dateTime.millisecondsSinceEpoch;

    Map<String, dynamic> user = new Map<String, dynamic>();
    user["date"] = millisecondsSinceEpoch;
    user["time_jiaofu"] = kpiItemBean.time_jiaofu;
    user["time_baohe"] = kpiItemBean.time_baohe;
    user["quality_bug"] = kpiItemBean.quality_bug;
    user["quality_diff"] = kpiItemBean.quality_diff;
    user["attitude_person"] = kpiItemBean.attitude_person;
    user["attitude_team"] = kpiItemBean.attitude_team;
    FlutterOrmPlugin.saveOrm("KPIItem", user);
  }
}

class KPIItemBean {
  int time_jiaofu;

  int time_baohe;

  int quality_bug;

  int quality_diff;

  int attitude_person;

  int attitude_team;

  int get count_all =>
      time_jiaofu +
          time_baohe +
          quality_bug +
          quality_diff +
          attitude_person +
          attitude_team;

  int get count_time => time_jiaofu + time_baohe;

  int get count_quality => quality_bug + quality_diff;

  int get count_attitude => attitude_person + attitude_team;

  KPIItemBean({
    this.time_jiaofu = 0,
    this.time_baohe = 0,
    this.quality_bug = 0,
    this.quality_diff = 0,
    this.attitude_person = 0,
    this.attitude_team = 0,
  });
}

class DialogItemBean {
  String title;
  int fenshu_start;
  int fenshu_end;

  DialogItemBean({
    this.title,
    this.fenshu_start = 0,
    this.fenshu_end = 0,
  });
}

class DialogBean {
//  //得分
//  int value;

  //选择哪一项
  int selectValue;
  String title;
  List<DialogItemBean> list;

  //六种类型
  int type;

  DialogBean({
//    this.value = 0,
    this.list,
    this.title,
    this.selectValue = 0,
    this.type,
  });
}
