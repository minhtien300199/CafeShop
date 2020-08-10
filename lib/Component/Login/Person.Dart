import 'package:cafeshop/Services/UserAPI.dart';
import 'package:flutter/material.dart';
import '../Login/Login.dart';
import 'package:cafeshop/Models/User.dart';

class Person extends StatefulWidget {
  final User user;
  //final user.userName;
  Person({Key key, this.user}) : super(key: key);
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  bool hasData = false;
  Future<User> futureUser;
  void setUserInfo() {
    //@override
    setState(() {
      if (widget.user == null) {
        // print("true");
        hasData = false;
      } else
        hasData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    setUserInfo();
    print(hasData);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: hasData == true
                ? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(Icons.account_circle, size: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("${widget.user.userName}"),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(Icons.account_circle, size: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Khách"),
                      ),
                    ],
                  ),
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ),
                ),
              },
            )
          ],
        ),
      ),
    );
  }
}
