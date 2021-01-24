import 'package:cafeshop/Component/Common/CustomAppBar.dart';
import 'package:cafeshop/Component/Home/SecondPage.dart';
import 'package:cafeshop/Models/ListProducts.dart';
import 'package:cafeshop/Utils/Path.dart';
import 'package:cafeshop/Services/ProductsAPI.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';

class HomeView extends StatefulWidget {
  HomeView();
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<HomeView> {
  String passValue = '';
  String fromChild = '';
  int active = 0;
  final pageCtl = PageController(initialPage: 0);
  int total = 1;
  updateTitle(String data) {
    setState(() {
      fromChild = data;
    });
  }

  void updateList(int value) {
    setState(() {
      active = value;
    });
    // print("value is $value and total is: $total");
  }

  // final _formKey = GlobalKey<FormState>();
  var store;

  @override
  void initState() {
    store = fetchProduct();
    super.initState();
  }

  Widget customCarousel(
      CarouselController controller, Function onchangeCarousel) {
    return FutureBuilder<ListProduct>(
      future: store,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("lỗi!");
        } else {
          if (snapshot.hasData) {
            total = snapshot.data.listProduct.length;
            return CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  initialPage: 0,
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height * 0.4,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    onchangeCarousel(index);
                  },
                ),
                items: snapshot.data.listProduct.map((item) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border(
                              top: BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              right: BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              bottom: BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              left: BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                            )),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            new Positioned(
                                width: constraints.biggest.width,
                                height: constraints.biggest.height,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      path['google-store'] + item.mainImage,
                                      fit: BoxFit.fill,
                                    ))),
                            Text(
                              "${item.productName}",
                              style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 25,
                                  shadows: [
                                    Shadow(
                                        color: Colors.amberAccent,
                                        blurRadius: 10)
                                  ]),
                            ),
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

//home
  @override
  Widget build(BuildContext context) {
    final carouselCtrl = CarouselController();
    //final pageStore = PageStorageKey;
    return Scaffold(
        appBar: CustomAppBar(
          color: Colors.green,
          height: MediaQuery.of(context).size.height * 0.12,
          child: Column(
            children: [
              Expanded(child: Container()),
              Expanded(
                  child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                        Text(
                          "Home",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ))
                ],
              ))
            ],
          ),
        ),
        body: PageView(
          controller: pageCtl,
          scrollDirection: Axis.vertical,
          children: [
            //1st page
            Container(
                padding:
                    EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Text(
                        "BEST SALE",
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    customCarousel(carouselCtrl, this.updateList),
                    FutureBuilder(
                      future: store,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Center(
                            child: DotsIndicator(
                              dotsCount: this.total,
                              position: this.active.toDouble(),
                            ),
                          );
                        }
                        return JumpingDotsProgressIndicator(
                          fontSize: 50.0,
                        );
                      },
                    ),
                    SecondPage()
                  ],
                )),
            //2nd page
            // SecondPage()
          ],
        ));
  }
}
