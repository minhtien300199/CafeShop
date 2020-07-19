import 'dart:convert';

import 'package:cafeshop/Models/ListProducts.dart';
import 'package:cafeshop/Services/ProductsAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';

import 'Models/Product.dart';

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

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Order here"),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String passValue = '';
  String fromChild = '';
  updateTitle(String data) {
    setState(() {
      fromChild = data;
    });
  }

  final _formKey = GlobalKey<FormState>();
  var store;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final carouselCtrl = CarouselController();
    final pageStore = PageStorageKey;
    return Container(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Best Seller!",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
            CarouselSlider(
              carouselController: carouselCtrl,
              options: CarouselOptions(
                pageViewKey: PageStorageKey(pageStore),
                enlargeCenterPage: true,
                height: 200,
                autoPlay: true,
              ),
              items: [
                ProductsList(),
                Text("2"),
                Text("3"),
                Text("4"),
                Text("5"),
                Text("6"),
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: i,
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(
                            width: 1,
                            color: Colors.black,
                            style: BorderStyle.solid),
                        right: BorderSide(
                            width: 1,
                            color: Colors.black,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                            width: 1,
                            color: Colors.black,
                            style: BorderStyle.solid),
                        left: BorderSide(
                            width: 1,
                            color: Colors.black,
                            style: BorderStyle.solid),
                      )),
                    );
                  },
                );
              }).toList(),
            ),
            Center(
              child: Text(pageStore.toString()),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    carouselCtrl.previousPage();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    carouselCtrl.nextPage();
                  },
                ),
              ],
            )
          ],
        ));
  }
}

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  var store;
  void initState() {
    // TODO: implement initState
    store = fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<ListProduct>(
        future: store,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("lỗi!");
          } else {
            if (snapshot.hasData) {
              print(snapshot.data.listProduct[0].id);
              return Text("${snapshot.data.listProduct[0].body}");
            } else {
              return CircularProgressIndicator();
            }
          }
        },
      ),
    );
  }
}
