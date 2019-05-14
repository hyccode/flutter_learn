import 'package:common_utils/common_utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/common/baseful_widget.dart';
import 'package:flutter_app/data/protocol/chengyu_entity.dart';
import 'package:flutter/material.dart';

class ChengYuInfoList extends StatelessWidget {
  final ChengyuEntity chengyuEntity;

  const ChengYuInfoList({
    Key key,
    this.chengyuEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (chengyuEntity == null) {
      return Text("请填写你想查询的成语");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("首字部首：${chengyuEntity.bushou}"),
        Text("成语字头：${chengyuEntity.head}"),
        Text("拼音：${chengyuEntity.pinyin}"),
        Text("成语解释：${chengyuEntity.chengyujs}"),
        Text("成语出处：${chengyuEntity.from}"),
        Text("举例：${chengyuEntity.example}"),
        Text("语法：${chengyuEntity.yufa}"),
        Text("词语解释：${chengyuEntity.ciyujs}"),
        Text("引证解释：${chengyuEntity.yinzhengjs}"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("同义词:"),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Text(chengyuEntity.tongyi[index]);
                },
                itemCount: chengyuEntity.tongyi == null
                    ? 0
                    : chengyuEntity.tongyi.length,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("反义词:"),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Text(chengyuEntity.fanyi[index]);
                },
                itemCount: chengyuEntity.fanyi == null
                    ? 0
                    : chengyuEntity.fanyi.length,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
