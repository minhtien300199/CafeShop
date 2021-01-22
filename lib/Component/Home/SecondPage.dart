import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 5),
                          color: Colors.black.withOpacity(0.1))
                    ]),
                height: MediaQuery.of(context).size.height * 0.1,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/onlineorder.png",
                      width: 40,
                      height: 40,
                    ),
                    Text("ORDER NOW!")
                  ],
                ),
              )),
              Expanded(
                  child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(5, 5),
                              color: Colors.black.withOpacity(0.1))
                        ]),
                    height: MediaQuery.of(context).size.height * 0.1,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/takeaway.png",
                          width: 40,
                          height: 40,
                        ),
                        Text("TAKE AWAY!")
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(), //TODO: SOME TING HERE
                  )
                ],
              ))
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 50),
          ),
        ],
      ),
    );
  }
}
