import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/bored_page/clock_page/death_clock_no_date.dart';



class DeathClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeathPageState();
}

class DeathPageState extends State<DeathClock> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: getView(),
    );
  }


  getView() {
    return DeathClockNoDate();
  }




}


