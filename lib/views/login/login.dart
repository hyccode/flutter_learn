import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/login_log.png',
                  width: 60.0,
                  height: 60.0,
                ),
                const SizedBox(height: 16.0),
                Text(
                  '登录页面',
                  style: Theme.of(context).textTheme.headline,
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: '请输入您的账号',
                labelText: '账号 *',
              ),
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                hintText: '请输入您的密码',
                labelText: '密码 *',
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

  //点击登录
  void _handleSubmitted() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.home, (Route<dynamic> route) => false);
  }
}
