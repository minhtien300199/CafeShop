import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<double> animatedOffset = [0, 0, 0, 0];
  bool onpressedBtnOrder = false;
  bool onPressedBtnTakeAway = false;
  bool onHoldBtnOrder = false;
  Key takeAwayKey = Key("takeAway");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    onpressedBtnOrder = true;
                    //make press animation
                    animatedOffset[2] = 5;
                    animatedOffset[3] = 5;
                  });
                },
                child: Stack(
                  children: [
                    //shadow here
                    Positioned(
                        child: Container(
                      margin: EdgeInsets.all(10),
                      // alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(5, 5),
                                color: Colors.black.withOpacity(0.1))
                          ]),
                    )),
                    AnimatedPositioned(
                        top: animatedOffset[2],
                        left: animatedOffset[3],
                        onEnd: () {
                          setState(() {
                            onpressedBtnOrder = false;
                            //make press animation
                            animatedOffset[2] = 0;
                            animatedOffset[3] = 0;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: onpressedBtnOrder
                                ? Colors.black26.withOpacity(0.2)
                                : Colors.white,
                            border: Border.all(width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: MediaQuery.of(context).size.height * 0.1,
                          // alignment: Alignment.center,
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
                        ),
                        duration: Duration(milliseconds: 100)),
                  ],
                ),
              ),
              //takeaway
              GestureDetector(
                onTap: () {
                  setState(() {
                    onPressedBtnTakeAway = true;
                    //make press animation
                    animatedOffset[0] = 5;
                    animatedOffset[1] = 5;
                  });
                },
                child: Stack(
                  children: [
                    //shadow here
                    Positioned(
                        child: Container(
                      margin: EdgeInsets.all(10),
                      // alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(5, 5),
                                color: Colors.black.withOpacity(0.1))
                          ]),
                    )),
                    AnimatedPositioned(
                        top: animatedOffset[0],
                        left: animatedOffset[1],
                        onEnd: () {
                          setState(() {
                            onPressedBtnTakeAway = false;
                            //make press animation
                            animatedOffset[0] = 0;
                            animatedOffset[1] = 0;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: onPressedBtnTakeAway
                                ? Colors.black26.withOpacity(0.2)
                                : Colors.white,
                            border: Border.all(width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: MediaQuery.of(context).size.height * 0.1,
                          // alignment: Alignment.center,
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
                        duration: Duration(milliseconds: 100)),
                  ],
                ),
              )
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
          ),
        ],
      ),
    );
  }
}
