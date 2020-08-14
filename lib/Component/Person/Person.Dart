import 'package:cafeshop/Component/Person/Profile.dart';
import 'package:cafeshop/Services/UserAPI.dart';
import 'package:flutter/material.dart';
import '../Person/Login.dart';
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
          //   title: Container(
          //     child: name != "0"
          //         ? Row(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(0.0),
          //                 child: Icon(Icons.account_circle, size: 40),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.all(4.0),
          //                 child: Text('$name'),
          //               ),
          //             ],
          //           )
          //         : Row(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(0.0),
          //                 child: Icon(Icons.account_circle, size: 40),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.all(4.0),
          //                 child: Text("Khách"),
          //               ),
          //             ],
          //           ),
          //   ),
          // ),

          title: Text("Thông tin cá nhân"),
          centerTitle: true,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue, Colors.pink[200]]),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 350.0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://i.imgur.com/7dbiqsi.png",
                            ),
                            radius: 75,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Phượng Quỳnh",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text("Email: " + "hieundac3@gmail.com",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          SizedBox(height: 10),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            clipBehavior: Clip.antiAlias,
                            elevation: 5,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 22),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text("Số điện thoại",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Text("0348845163")
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text("Tên đăng nhập",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Text("hieuitute")
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text("Sinh nhật",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Text("20/10/1999")
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
                title: Text('Thay đổi thông tin'),
                trailing: Icon(Icons.edit),
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => Profile());
                  Navigator.push(context, route);
                }),
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
