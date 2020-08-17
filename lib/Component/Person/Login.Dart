import 'dart:io';

import 'package:cafeshop/Models/User.dart';
import '../Person/Person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './ProgressHUD.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Person person;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  addUserToSharedPreferences(UserResponseModel user) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('stringValue', user.userName);
  }

  bool hidePassword = true;
  User userRequest;
  // bool isLoading = false;
  bool isApiCallProcess = false;

  final _auth = FirebaseAuth.instance;
  final _facebooklogin = FacebookLogin();
  bool _isLoggedIn = false;
  String _message;
  String _avatar;

  Future _loginWithFacebook() async {
    final result = await _facebooklogin.logIn(['email']);

    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token);
      //Lấy thông tin User qua credential có giá trị token đã đăng nhập
      final user = (await _auth.signInWithCredential(credential)).user;
      setState(() {
        print((user.toString()));
        _message = "Logged in as ${user.displayName}";
        _avatar = user.photoUrl;
        _isLoggedIn = true;
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

  Future _checkLogin() async {
    // Kiểm tra xem user đã đăng nhập hay chưa
    final user = await _auth.currentUser();
    if (user != null) {
      setState(() {
        //_message = "Logged in as ${user.toString()}";
        _isLoggedIn = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //userRequest = new User();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 300,
                        // width: 300,
                        child: Image.asset("assets/images/logoCoffee.png",
                            fit: BoxFit.cover),
                      ),
                      //SizedBox(height: 20),
                      // new TextFormField(
                      //   keyboardType: TextInputType.emailAddress,
                      //   onSaved: (input) => userRequest.userName = input,
                      //   validator: (input) => !input.contains("@")
                      //       ? "Email ID shoud be valid"
                      //       : null,
                      //   style: TextStyle(fontSize: 20),
                      //   decoration: new InputDecoration(
                      //     hintText: "Email address",
                      //     enabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: Theme.of(context)
                      //             .accentColor
                      //             .withOpacity(0.2),
                      //       ),
                      //     ),
                      //     focusedBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: Theme.of(context).accentColor,
                      //       ),
                      //     ),
                      //     prefixIcon: Icon(Icons.email,
                      //         color: Theme.of(context).accentColor),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // new TextFormField(
                      //   keyboardType: TextInputType.text,
                      //   validator: (input) => input.length < 3
                      //       ? "Password shoud be more than 3 characters"
                      //       : null,
                      //   style: TextStyle(fontSize: 20),
                      //   onSaved: (input) => userRequest.password = input,
                      //   obscureText: hidePassword,
                      //   decoration: new InputDecoration(
                      //     hintText: "Password",
                      //     enabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: Theme.of(context)
                      //             .accentColor
                      //             .withOpacity(0.2),
                      //       ),
                      //     ),
                      //     focusedBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: Theme.of(context).accentColor,
                      //       ),
                      //     ),
                      //     prefixIcon: Icon(Icons.lock,
                      //         color: Theme.of(context).accentColor),
                      //     suffixIcon: IconButton(
                      //       onPressed: () {
                      //         setState(() {
                      //           hidePassword = !hidePassword;
                      //         });
                      //       },
                      //       color:
                      //           Theme.of(context).accentColor.withOpacity(0.4),
                      //       icon: Icon(hidePassword
                      //           ? Icons.visibility_off
                      //           : Icons.visibility),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 50),
                      Center(
                        child: GoogleSignInButton(
                          //  / splashColor: Colors.blue,
                          darkMode: true,
                          onPressed: null,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: FacebookSignInButton(
                          onPressed: () async {
                            setState(() {
                              isApiCallProcess = true;
                            });
                            await _loginWithFacebook();
                            await _checkLogin();

                            if (_isLoggedIn == true) {
                              // print(_isLoggedIn);
                              Navigator.pop(context, true);
                            }
                          },
                        ),
                      ),
                      // SizedBox(height: 115),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
