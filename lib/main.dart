import 'package:flutter/material.dart';
import './Component/Person/Login.dart';
import './Component/Favorite/FavoriteView.dart';
import './Component/Home/HomeView.dart';
import './Component/Order/OrderView.dart';
import './Component/Person/Person.dart';

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
      child: HomeView(),
    ),
    //Favorites
    Container(
      child: FavoritePage(),
    ),
    //OrderPage
    Container(
      child: OrderPage(),
    ),
    //Login
    Container(
      // color: Colors.white,
      child: Person(),
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
              icon: Icon(Icons.favorite),
              title: Text('Favories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Orders'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text('Person'),
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedIconTheme: Colors.amber[800],
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
