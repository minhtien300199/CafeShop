import 'package:cafeshop/Component/Common/CustomAppBar.dart';
import 'package:cafeshop/Models/ListCategory.dart';
import 'package:cafeshop/Utils/Path.dart';
import 'package:cafeshop/Services/CategoryAPI.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  IconData _activeIcon = Icons.menu;
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
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );
    setState(() {
      _activeIcon = Icons.menu;
    });
    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
    listCate = fetchCategory();
    sliverGrid = new SliverGridDelegateWithMaxCrossAxisExtent(
      mainAxisSpacing: 0,
      maxCrossAxisExtent: 250,
      childAspectRatio: 1,
    );
    // _tabController = TabController(vsync: this, length: list.length);
  }

  void changeStateMenu(bool state) {
    setState(() {
      _activeIcon = state ? Icons.close : Icons.menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ListCategory>(
      future: listCate,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionBubble(
                items: [
                  Bubble(
                    title: "Search",
                    iconColor: Colors.white,
                    bubbleColor: Colors.green,
                    icon: Icons.search,
                    titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                    onPress: () {
                      _animationController.reverse();
                      changeStateMenu(false);
                    },
                  ),
                  // Floating action menu item
                  Bubble(
                    title: "Your bag",
                    iconColor: Colors.white,
                    bubbleColor: Colors.green,
                    icon: Icons.shopping_bag,
                    titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                    onPress: () {
                      _animationController.reverse();
                      changeStateMenu(false);
                    },
                  ),
                  //Floating action menu item
                  // Bubble(
                  //   title: "Home",
                  //   iconColor: Colors.white,
                  //   bubbleColor: Colors.blue,
                  //   icon: Icons.home,
                  //   titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                  //   onPress: () {
                  //     _animationController.reverse();
                  //     changeStateMenu(false);
                  //   },
                  // )
                ],
                animation: _animation,
                onPress: () {
                  // () => _animationController.isCompleted
                  //     ? _animationController.reverse()
                  //     : _animationController.forward();
                  if (_animationController.isCompleted) {
                    _animationController.reverse();
                    changeStateMenu(false);
                  } else {
                    _animationController.forward();
                    changeStateMenu(true);
                  }
                },
                iconColor: Colors.white,
                iconData: _activeIcon,
                backGroundColor: Colors.green,
              ),

              // appBar: AppBar(
              //   title: Text('Order'),
              //   bottom: TabBar(
              //       controller: _tabController = new TabController(
              //           length: snapshot.data.listCategory.length,
              //           initialIndex: 0,
              //           vsync: this),
              //       tabs: snapshot.data.listCategory.map((e) {
              //         return Tab(
              //           child: Text("${e.name}"),
              //         );
              //       }).toList()),
              // ),
              appBar: CustomAppBarWithTab(
                color: Colors.green,
                height: MediaQuery.of(context).size.height * 0.15,
                title: Expanded(
                    child: Container(
                  padding: EdgeInsets.only(top: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.search,
                            size: MediaQuery.of(context).size.height * 0.05,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            size: MediaQuery.of(context).size.height * 0.05,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                )),
                bottom: TabBar(
                    indicator: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    )),
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
                          Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                child: LayoutBuilder(
                                    builder: (context, constrain) {
                                  if (constrain.maxWidth < 200) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          product.productName,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.red[300]),
                                        ),
                                        Text(product.productDescription,
                                            style: TextStyle(fontSize: 15)),
                                        Text('Price: ${product.price} VNĐ'),
                                        SizedBox(
                                          width: 110,
                                          child: RaisedButton.icon(
                                            onPressed: () => {},
                                            icon: Icon(Icons.add_shopping_cart),
                                            label: Text("Detail"),
                                            color: Colors.lightBlueAccent[100],
                                            padding: EdgeInsets.all(10),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 110,
                                          child: RaisedButton.icon(
                                            onPressed: () => {},
                                            icon: Icon(Icons.favorite_border),
                                            label: Text("Favorite"),
                                            color: Colors.lightBlueAccent[100],
                                            padding: EdgeInsets.all(10),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          product.productName,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.red[300]),
                                        ),
                                        Text(product.productDescription,
                                            style: TextStyle(fontSize: 15)),
                                        Text('Price: ${product.price} VNĐ'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 110,
                                              child: RaisedButton.icon(
                                                onPressed: () => {},
                                                icon: Icon(
                                                    Icons.add_shopping_cart),
                                                label: Text("Detail"),
                                                color:
                                                    Colors.lightBlueAccent[100],
                                                padding: EdgeInsets.all(10),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 110,
                                              child: RaisedButton.icon(
                                                onPressed: () => {},
                                                icon:
                                                    Icon(Icons.favorite_border),
                                                label: Text("Favorite"),
                                                color:
                                                    Colors.lightBlueAccent[100],
                                                padding: EdgeInsets.all(10),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  }
                                }),
                              ))
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
