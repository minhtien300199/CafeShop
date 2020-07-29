import 'package:cafeshop/Models/ListCategory.dart';
import 'package:cafeshop/Services/CategoryAPI.dart';
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
  @override
  void initState() {
    super.initState();
    listCate = fetchCategory();
    // _tabController = TabController(vsync: this, length: list.length);
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

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
                  return Center(
                    child: Text('This is ${item.name} tab'),
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
