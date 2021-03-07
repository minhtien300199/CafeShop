import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
  List<Color> navItemColor = [
    Colors.white,
    Colors.pink,
    Colors.white,
    Colors.yellow
  ];
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
        bottomNavigationBar: SizedBox(
            child: CustomBottomNavigationBar(
              // itemOutlineColor: Colors.white.withOpacity(0.2),
              items: <CustomBottomNavigationBarItem>[
                CustomBottomNavigationBarItem(
                  icon: Icons.home,
                  title: 'Home',
                ),
                CustomBottomNavigationBarItem(
                  icon: Icons.favorite,
                  title: 'Favories',
                ),
                CustomBottomNavigationBarItem(
                  icon: Icons.shopping_cart,
                  title: 'Orders',
                ),
                CustomBottomNavigationBarItem(
                  icon: MaterialCommunityIcons.account,
                  title: 'Person',
                ),
              ],
              selectedItemColor: navItemColor[_selectedIndex],
              backgroundColor: Colors.green,
              // type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.black87,
              onTap: _onItemTapped,
            ),
            width: double.infinity,
            height: 85),
      ),
    );
  }
}
