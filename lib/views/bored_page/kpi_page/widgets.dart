import 'package:flutter/material.dart';
import 'package:flutter_app/views/bored_page/kpi_page/kpi_page.dart';

class CheckPage extends StatefulWidget {
  DialogBean timeList;
  final ValueChanged<int> selectDate;

  CheckPage(this.timeList, this.selectDate);

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<CheckPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: allCheckboxs(context, this, widget.timeList),
    );
  }
}

// 所有的 Checkbox 按钮
allCheckboxs(BuildContext context, _CheckState that, DialogBean timeList) {
  List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
  Widget content; //单独一个widget组件，用于返回需要生成的内容widget
  for (int i = 0; i < timeList.list.length; i++) {
    tiles.add(
      CheckboxSelect(context.widget, that, i, timeList.list[i].title),
    );
  }
  content = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
      //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
      );
  return content;
}

/// Checkbox 默认的实例
/// index 当前checkbox 的索引值
class CheckboxSelect extends StatelessWidget {
  final int index;
  final widget;
  final parent;
  final String string;

  const CheckboxSelect([this.widget, this.parent, this.index = 0, this.string])
      : super();

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: parent.widget.timeList.selectValue == this.index,
        title: Text(string),
        controlAffinity: ListTileControlAffinity.platform,
        onChanged: (bool bol) {
          if (parent.mounted) {
            parent.setState(() {
              parent.widget.timeList.selectValue = this.index;
              parent.widget.selectDate(this.index);
            });
          }
        });
  }
}
