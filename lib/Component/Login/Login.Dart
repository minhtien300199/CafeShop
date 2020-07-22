import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  // const LoginView({Key key}) : super(key: key);
  LoginView() {}
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        'LOGIN',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      SizedBox(
        height: 70.0,
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(
        height: 45.0,
      ),
      TextFormField(
        obscureText: false,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      ),
      SizedBox(
        height: 25.0,
      ),
      TextFormField(
        obscureText: true,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      ),
      SizedBox(
        height: 35.0,
      ),
      Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]);
  }
}
