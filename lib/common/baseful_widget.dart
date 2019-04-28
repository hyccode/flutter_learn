import 'package:flutter/material.dart';

abstract class BasefulWidget extends StatefulWidget {
  State<BasefulWidget> state;

  @override
  createState() => _BasefulWidgetState();

  @protected
  Widget build(BuildContext context);

  void initState() {}

  void dispose(){}

}

class _BasefulWidgetState extends State<BasefulWidget> {
  @override
  void initState() {
    super.initState();
    widget.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.state = this;
    return widget.build(context);
  }

  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }

}