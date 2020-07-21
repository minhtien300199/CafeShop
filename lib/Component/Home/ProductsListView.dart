import 'package:cafeshop/Models/ListProducts.dart';
import 'package:cafeshop/Services/ProductsAPI.dart';
import 'package:flutter/material.dart';

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
                                border:
                                    Border.all(width: 1, color: Colors.blue)),
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
      ),
    );
  }
}
