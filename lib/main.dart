import 'package:flutter/material.dart';
import './Component/Login/Login.dart';
import './Component/Favorite/FavoriteView.dart';
import './Component/Home/HomeView.dart';
import './Component/Order/OrderView.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    //HomeView
    Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: <Widget>[
            HomeView(),
          ],
        ),
      ),
    ),
    //Favories
    Container(
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FavoritePage(),
            ]),
      ),
    ),
    //OrderPage
    Container(
      child: OrderPage(),
    ),
    //Login
    Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginView(),
            ]),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.red),
              title: Text('Favories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.cyan),
              title: Text('Orders'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box, color: Colors.blue),
              title: Text('Person'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black87,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
