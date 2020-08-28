import 'package:cafeshop/Component/Person/Profile.dart';
import 'package:cafeshop/Services/UserAPI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import '../Person/Login.dart';
import 'package:cafeshop/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Person extends StatefulWidget {
  // final User user;
  //final user.userName;
  bool changeSate;
  Person({Key key, this.changeSate}) : super(key: key);
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  final _auth = FirebaseAuth.instance;
  final _facebooklogin = FacebookLogin();
  User userLoggedIn;
  AuthCredential credential;
  //String name;
  bool _isLoggedIn = false;
  String _message;
  String _userID;
  String _avatar;
  String _email;
  Future _checkLogin() async {
    // Kiểm tra xem user đã đăng nhập hay chưa
    final user = await _auth.currentUser();

    if (user != null) {
      setState(() {
        print("person: ${user.toString()}");
        _message = user.displayName;
        //_message = "Logged in as ${user.toString()}";
        _email = user.email;
        _avatar = user.photoUrl;
        _isLoggedIn = true;
        _userID = user.uid;
        print(_isLoggedIn);
      });
    }
  }

  Future _logout() async {
    // SignOut khỏi Firebase Auth
    await _auth.signOut();
    // Logout facebook
    await _facebooklogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    //_checkLogin();
    // print(_isLoggedIn);
    //getStringValuesSF();
    // setUserInfo();
    // print(hasData);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Thông tin cá nhân"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  _isLoggedIn
                                      ? "$_avatar"
                                      : "https://i.imgur.com/DErQVbL.png",
                                ),
                                radius: 70,
                              ),
                              SizedBox(height: 10),
                              Text(
                                _isLoggedIn == true ? _message : "Khách",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(_isLoggedIn ? _email : " ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black)),
                              SizedBox(height: 10),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                clipBehavior: Clip.antiAlias,
                                shadowColor: Colors.black,
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
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Text("")
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Text("Sinh nhật",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Text("")
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
                Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: [
                        ListTile(
                            title: Text('Thay đổi thông tin'),
                            trailing: Icon(Icons.edit),
                            onTap: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => Profile());
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
                        _isLoggedIn == false
                            ? ListTile(
                                title: Text('Đăng nhập'),
                                trailing: Icon(Icons.accessibility),
                                onTap: () async => {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginView(),
                                    ),
                                  ),
                                  _checkLogin(),
                                },
                              )
                            : ListTile(
                                title: Text("Đăng xuất"),
                                trailing: Icon(Icons.subdirectory_arrow_right),
                                onTap: () {
                                  _logout();
                                })
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
