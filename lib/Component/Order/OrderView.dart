import 'package:cafeshop/Models/ListCategory.dart';
import 'package:cafeshop/Path.dart';
import 'package:cafeshop/Services/CategoryAPI.dart';
import 'package:cafeshop/uri.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Nước uống'),
    Tab(text: 'Thức ăn'),
  ];
  Future<ListCategory> listCate;
  TabController _tabController;
  List<Widget> list = new List<Widget>();
  SliverGridDelegate sliverGrid;
  @override
  void initState() {
    super.initState();
    listCate = fetchCategory();
    sliverGrid = new SliverGridDelegateWithMaxCrossAxisExtent(
      mainAxisSpacing: 0,
      maxCrossAxisExtent: 250,
      childAspectRatio: 1,
    );
    // _tabController = TabController(vsync: this, length: list.length);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ListCategory>(
      future: listCate,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                    controller: _tabController = new TabController(
                        length: snapshot.data.listCategory.length,
                        initialIndex: 0,
                        vsync: this),
                    tabs: snapshot.data.listCategory.map((e) {
                      return Tab(
                        child: Text("${e.name}"),
                      );
                    }).toList()),
              ),
              body: TabBarView(
                controller: _tabController,
                children: snapshot.data.listCategory.map((item) {
                  List<Widget> productView = new List<Widget>();
                  for (var product in item.products) {
                    productView.add(new Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(bottom: 20, left: 5, right: 10),
                      constraints: BoxConstraints(),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 6,
                                spreadRadius: 2,
                                offset: Offset(3, 3))
                          ],
                          border: Border.all(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.grey)),
                      child: Row(
                        children: <Widget>[
                          Image.network(
                            path['google-store'] + product.mainImage,
                            width: 150,
                            height: 150,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  product.productName,
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(product.productDescription,
                                    style: TextStyle(fontSize: 10)),
                                RaisedButton.icon(
                                  onPressed: () => {},
                                  icon: Icon(Icons.add_shopping_cart),
                                  label: Text("Chi tiết"),
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
                  }
                  return ListView(
                    padding: EdgeInsets.only(top: 5),
                    semanticChildCount: productView.length,
                    // gridDelegate: sliverGrid,
                    scrollDirection: Axis.vertical,
                    children: productView,
                  );
                }).toList(),
              ));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

/**
 *  myTabs.map((Tab tab) {
          final String label = tab.text.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 20),
            ),
          );
        }).toList(),
 */
