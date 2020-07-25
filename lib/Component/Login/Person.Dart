import 'package:flutter/material.dart';
import '../Login/Login.dart';

class Person extends StatelessWidget {
  void selectionLogin() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {},
       ListView(
        children: <Widget>[
          ListTile(
              title: Text('Tài khoản cá nhân'),
              trailing: Icon(Icons.account_circle),
              onTap: null),
          ListTile(
              title: Text('Đơn hàng đã mua'),
              trailing: Icon(Icons.assignment),
              onTap: null),
          ListTile(
              title: Text('Thông tin thanh toán'),
              trailing: Icon(Icons.payment),
              onTap: null),
          ListTile(
              title: Text('Đăng nhập'),
              trailing: Icon(Icons.accessibility),
              onTap: null)
        ],
      ),
    );
  }
}
