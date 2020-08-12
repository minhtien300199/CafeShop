import 'package:cafeshop/Services/UserAPI.dart';
import 'package:flutter/material.dart';
import '../Login/Login.dart';
import 'package:cafeshop/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Person extends StatefulWidget {
  // final User user;
  //final user.userName;
  Person({Key key}) : super(key: key);
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  //bool hasData = false;
  // Future<User> futureUser;
  // void setUserInfo() {
  //   //@override
  //   setState(() {
  //     if (widget.user == null) {
  //       // print("true");
  //       hasData = false;
  //     } else
  //       hasData = true;
  //   });
  // }
  String name;
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('stringValue') ?? "0";
    });

    //return stringValue;
  }

  @override
  Widget build(BuildContext context) {
    getStringValuesSF();
    // setUserInfo();
    // print(hasData);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: name != "0"
                ? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(Icons.account_circle, size: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('$name'),
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
            name == '0'
                ? ListTile(
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
                : ListTile(
                    title: Text("Đăng xuất"),
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      setState(() {
                        prefs.remove('stringValue');
                      });
                    })
          ],
        ),
      ),
    );
  }
}
