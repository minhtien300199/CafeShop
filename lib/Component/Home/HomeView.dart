import 'package:cafeshop/Models/ListProducts.dart';
import 'package:cafeshop/Path.dart';
import 'package:cafeshop/Services/ProductsAPI.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class HomeView extends StatefulWidget {
  HomeView() {}
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<HomeView> {
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
    store = fetchProduct();
    super.initState();
  }

  Widget handleLoadData(CarouselController controller) {
    return FutureBuilder<ListProduct>(
      future: store,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("lỗi!");
        } else {
          if (snapshot.hasData) {
            print(snapshot.data.listProduct[0].id);
            return CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height * 0.4,
                  autoPlay: true,
                ),
                items: snapshot.data.listProduct.map((item) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
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
                        child: Stack(
                          children: [
                            new Positioned(
                                width: constraints.biggest.width,
                                height: constraints.biggest.height,
                                child: Image.network(
                                  path['google-store'] + item.mainImage,
                                  fit: BoxFit.fill,
                                )),
                            new Positioned(
                                top: constraints.biggest.height * 0.05,
                                left: constraints.biggest.width * 0.03,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.blue)),
                                  child: Text(
                                    "${item.productName}",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  );
                }).toList());
          } else {
            return CircularProgressIndicator();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final carouselCtrl = CarouselController();
    final pageStore = PageStorageKey;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: null,
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: Container(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Best sale!",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
                handleLoadData(carouselCtrl),
                Center(child: Text("Detail")),
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
            )));
  }
}

//item widget
// LayoutBuilder(
//                 builder: (context, constraints) {
//                   return new Stack(
//                     children: [
//                       new Positioned(
//                           width: constraints.biggest.width,
//                           height: constraints.biggest.height,
//                           child: Image.network(
//                             path['google-store'] +
//                                 'images/iceblendedcoffee.jpg',
//                             fit: BoxFit.fill,
//                           )),
//                       new Positioned(
//                           top: constraints.biggest.height * 0.05,
//                           left: constraints.biggest.width * 0.03,
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                                 border:
//                                     Border.all(width: 1, color: Colors.blue)),
//                             child: Text(
//                               "${snapshot.data.listProduct[0].productName}",
//                               style: TextStyle(color: Colors.red),
//                             ),
//                           ))
//                     ],
//                   );
//                 },
//               )
