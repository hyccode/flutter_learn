import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Checkbox 默认的实例
/// index 当前checkbox 的索引值
class CheckboxSelect extends StatelessWidget {
  final int index;
  final widget;
  final parent;

  const CheckboxSelect([this.widget, this.parent, this.index = -1]) : super();

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: parent.selectValue == this.index,
        onChanged: (bool bol) {
          if (parent.mounted) {
            parent.setState(() {
              parent.selectValue = bol ? this.index : -1;
            });
          }
        });
  }
/**
 * CheckboxListTile(
    value: isChecks[0],
    title:  Text('选项1'),
    activeColor: _value ? Colors.red : Colors.green,
    controlAffinity: ListTileControlAffinity.platform,
    onChanged: (bool){
    if(mounted) {
    setState(() {
    isChecks[0] = bool;
    });
    }
    }),
 */
}
