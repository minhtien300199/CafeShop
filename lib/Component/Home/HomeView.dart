import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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

  Widget handleLoadData() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("lỗi!");
        } else {
          if (snapshot.hasData) {
            print(snapshot.data.listProduct[0].id);
            return Container(child: LayoutBuilder(
              builder: (context, constraints) {
                return new Stack(
                  children: [
                    new Positioned(
                        width: constraints.biggest.width,
                        height: constraints.biggest.height,
                        child: Image(
                          image: AssetImage('assets/images/third.jpg'),
                          fit: BoxFit.cover,
                        )),
                    new Positioned(
                        top: constraints.biggest.height * 0.05,
                        left: constraints.biggest.width * 0.03,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.blue)),
                          child: Text(
                            "${snapshot.data.listProduct[0].title}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                  ],
                );
              },
            ));
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
    return Container(
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
            CarouselSlider(
              carouselController: carouselCtrl,
              options: CarouselOptions(
                pageViewKey: PageStorageKey(pageStore),
                enlargeCenterPage: true,
                height: 200,
                autoPlay: true,
              ),
              items: [
                Text("1"),
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
        ));
  }
}
