import 'package:common_utils/common_utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/common/baseful_widget.dart';
import 'package:flutter_app/data/protocol/chengyu_entity.dart';
import 'package:flutter/material.dart';

class ChengYuInfoList extends StatelessWidget {
  final ChengyuEntity chengyuEntity;
  final String noticeMessage;

  const ChengYuInfoList({
    Key key,
    this.chengyuEntity,
    this.noticeMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (chengyuEntity == null) {
      return Text(noticeMessage ?? "请填写你想查询的成语");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("首字部首：${chengyuEntity.bushou}"),
        const SizedBox(height: 10.0),
        Text("成语字头：${chengyuEntity.head}"),
        const SizedBox(height: 10.0),
        Text("拼音：${chengyuEntity.pinyin}"),
        const SizedBox(height: 10.0),
        Text("成语解释：${chengyuEntity.chengyujs}"),
        const SizedBox(height: 10.0),
        Text("成语出处：${chengyuEntity.from}"),
        const SizedBox(height: 10.0),
        Text("举例：${chengyuEntity.example}"),
        const SizedBox(height: 10.0),
        Text("语法：${chengyuEntity.yufa}"),
        const SizedBox(height: 10.0),
        Text("词语解释：${chengyuEntity.ciyujs}"),
        const SizedBox(height: 10.0),
        Text("引证解释：${chengyuEntity.yinzhengjs}"),
        const SizedBox(height: 10.0),
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
        const SizedBox(height: 10.0),
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
