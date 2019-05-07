import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/shared_preferences.dart';
import 'package:flutter_app/views/bored_page/clock_page/share_data.dart';

const double _kPickerSheetHeight = 216.0;
const double _kPickerItemHeight = 32.0;

class DeathClockNoDate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeathClockNoDateState();
}

class DeathClockNoDateState extends State<DeathClockNoDate> {
  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getView(context);
  }


  Widget _buildColorPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: _selectedColorIndex);

    return GestureDetector(
      onTap: () async {
        await showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoPicker(
                scrollController: scrollController,
                itemExtent: _kPickerItemHeight,
                backgroundColor: CupertinoColors.white,
                onSelectedItemChanged: (int index) {
                  setState(() => _selectedColorIndex = index);
                },
                children:
                    List<Widget>.generate(getYearList().length, (int index) {
                  return Center(
                    child: Text(getYearList()[index].toString()),
                  );
                }),
              ),
            );
          },
        );
      },
      child: Container(
        height: 44.0,
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        alignment: Alignment.center,
        child: Text(
          getYearList()[_selectedColorIndex].toString() + "岁",
          style: const TextStyle(color: CupertinoColors.inactiveGray),
        ),
      ),
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

  List<int> getYearList() {
    List<int> list = new List();
    for (int i = 0; i < 150; i++) {
      list.add(i);
    }
    return list;
  }

  Widget getView(BuildContext context) {
    if (ShareWidget.of(context).data == null ||
        ShareWidget.of(context).fromTime == null) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          '请先选择你的出生日期和时间',
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            '选择你想活到的年龄',
            style: TextStyle(color: Colors.white),
          ),
          _buildColorPicker(context),
          IconButton(
            icon: Icon(Icons.check),
            color: Colors.white,
            disabledColor: Colors.white,
            onPressed: () {
              ShareWidget.of(context).notifyDeathYear(getYearList()[_selectedColorIndex]);
            },
          )
        ],
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("death_no Dependencies change");
  }
}
