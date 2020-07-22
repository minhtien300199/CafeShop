import 'package:flutter/material.dart';
import '../Login/Login.dart';
import '../Favorite/FavoriteView.dart';
import '../Home/HomeView.dart';
import '../Order/OrderView.dart';

class MainScreenLayout extends StatefulWidget {
  @override
  _ScreenLayoutState createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<MainScreenLayout> {
  int _selectedIndex = 0;

  static const List<Type> _widgetOptions = <Type>[
    HomeView,
    FavoritePage,
    OrderPage,
    LoginView,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
