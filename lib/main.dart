import 'package:flutter/material.dart';

import 'Component/Favorite/FavoriteView.dart';
import 'Component/Home/HomeView.dart';
import 'Component/Order/OrderView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/order': (context) => OrderPage()
      },
      title: 'Flutter Demo',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text("My Cafe Shop"),
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.free_breakfast),
                ),
                Tab(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                Tab(
                  icon: Icon(Icons.local_shipping),
                ),
              ]),
            ),
            body: TabBarView(children: [
              FirstPage(),
              OrderPage(),
              Center(
                child: Text("Ship here"),
              ),
              FavoritePage(),
            ])));
  }
}
