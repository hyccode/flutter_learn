import 'package:flutter_app/views/practice_page/index.dart' as practice;
import 'package:flutter_app/views/bored_page/index.dart' as bored;

class PageList {
  PageList();

  List getDemos() {
    List result = [];
    result.addAll(practice.widgetPoints);
    result.addAll(bored.widgetPoints);
    return result;
  }
}