import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/bored_page/kpi_page/kpi_page.dart';
import 'package:flutter_app/views/bored_page/kpi_page/widgets.dart';

const double _kPickerSheetHeight = 216.0;
const double _kPickerItemHeight = 32.0;

class MySimpLeDialog extends StatefulWidget {
  final ValueChanged<int> selectDate;
  final ValueChanged<int> selectValue;
  DialogBean listleft;

  MySimpLeDialog(this.listleft, this.selectDate, this.selectValue);

  @override
  State<StatefulWidget> createState() => MySimpLeDialogState();
}

class MySimpLeDialogState extends State<MySimpLeDialog> {
  int _selectedColorIndex = 0;

  FixedExtentScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController =
        FixedExtentScrollController(initialItem: _selectedColorIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SimpleDialog(
      title: Text(widget.listleft.title),
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: CheckPage(
                widget.listleft,
                (value) {
                  setState(() {
                    scrollController.jumpToItem(0);
                    widget.selectDate(value);
                    widget.listleft.selectValue = value;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: _buildBottomPicker(
                CupertinoPicker(
                  scrollController: scrollController,
                  itemExtent: _kPickerItemHeight,
                  backgroundColor: CupertinoColors.white,
                  onSelectedItemChanged: (int index) {
                    setState(() =>
                        (widget.selectValue(getList(widget.listleft)[index])));
                  },
                  children: List<Widget>.generate(
                      getList(widget.listleft).length, (int index) {
                    return Center(
                      child: Text(getList(widget.listleft)[index].toString()),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const RaisedButton(
            child: Text("确定"),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  List<int> getList(DialogBean listleft) {
    List<int> list = new List();
    for (int i = listleft.list[listleft.selectValue].fenshu_start;
        i <= listleft.list[listleft.selectValue].fenshu_end;
        i++) {
      list.add(i);
    }
    return list;
  }
}
