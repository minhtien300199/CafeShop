import 'dart:io';

import 'package:cafeshop/Models/User.dart';
import 'package:cafeshop/Services/UserAPI.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './ProgressHUD.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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

  @override
  void initState() {
    super.initState();
    userRequest = new User();
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
                // decoration: BoxDecoration(
                //  //   borderRadius: BorderRadius.circular(20),
                //     color: Theme.of(context).bottomAppBarColor,
                //     boxShadow: [
                //       BoxShadow(
                //           color: Theme.of(context).hintColor.withOpacity(0.3),
                //           offset: Offset(0, 10),
                //           blurRadius: 20)
                //     ]),
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
                      SizedBox(height: 20),
                      new TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (input) => userRequest.userName = input,
                        validator: (input) => !input.contains("@")
                            ? "Email ID shoud be valid"
                            : null,
                        style: TextStyle(fontSize: 20),
                        decoration: new InputDecoration(
                          hintText: "Email address",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          prefixIcon: Icon(Icons.email,
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (input) => input.length < 3
                            ? "Password shoud be more than 3 characters"
                            : null,
                        style: TextStyle(fontSize: 20),
                        onSaved: (input) => userRequest.password = input,
                        obscureText: hidePassword,
                        decoration: new InputDecoration(
                          hintText: "Password",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          prefixIcon: Icon(Icons.lock,
                              color: Theme.of(context).accentColor),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            color:
                                Theme.of(context).accentColor.withOpacity(0.4),
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                        onPressed: () {
                          if (validateAndSave()) {
                            setState(() {
                              isApiCallProcess = true;
                            });

                            UserAPI api = new UserAPI();
                            api.loginUser(userRequest).then((value) {
                              setState(() {
                                isApiCallProcess = false;
                              });

                              if (value.authenticate.isNotEmpty) {
                                final snackbar = SnackBar(
                                  content: Text("Login Successfull!"),
                                );
                                scaffoldKey.currentState.showSnackBar(snackbar);
                                addUserToSharedPreferences(value);
                                // sleep(Duration(seconds: 10));
                                Navigator.pop(context);
                              } else {
                                final snackbar = SnackBar(
                                  content: Text(
                                      "Email or password is invalid! Please try again!"),
                                );
                                scaffoldKey.currentState.showSnackBar(snackbar);
                              }
                            });
                          }
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        color: Theme.of(context).accentColor,
                        shape: StadiumBorder(),
                      ),
                      // SizedBox(height: 115),
                    ],
                  ),
                ),
              ),
            ])
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
