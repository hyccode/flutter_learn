import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routers.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LoginApp();
}

class LoginApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginPageState();
  }
}

class LoginPageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      key: _scaffoldKey,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                const SizedBox(height: 16.0),
                Text(
                  '登录页面',
                  style: Theme.of(context).textTheme.headline,
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            Form(
              key: _formKey,
              child: new Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: '请输入您的账号',
                      labelText: '账号 *',
                    ),
                    validator: (val) =>
                        (val == null || val.isEmpty) ? "账号不能为空" : null, //表单验证
                    onSaved: (val) {
                      _name = val;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: '请输入您的密码',
                      labelText: '密码 *',
                    ),
                    validator: (val) =>
                        (val == null || val.isEmpty) ? "密码不能为空" : null, //表单验证
                    onSaved: (val) {
                      _password = val;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Center(
              child: RaisedButton(
                child: const Text('登录'),
                onPressed: _handleSubmitted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _password;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  //点击登录
  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      showInSnackBar('请输入正确的账号密码！');
    } else {
      form.save();
//      Navigator.of(context).pushNamedAndRemoveUntil(
//          Routes.home, (Route<dynamic> route) => false);
      Application.router.navigateTo(context, Routes.home);
    }
  }
}
