import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderBtnBar extends StatefulWidget {
  @override
  _OrderBtnBarState createState() => _OrderBtnBarState();
}

class _OrderBtnBarState extends State<OrderBtnBar> {
  List<double> animatedOffset = [0, 0, 0, 0];
  bool onpressedBtnOrder = false;
  bool onPressedBtnTakeAway = false;
  bool onHoldBtnOrder = false;
  Key takeAwayKey = Key("takeAway");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              spreadRadius: 1,
                              blurRadius: 1.5,
                              offset: Offset(0, 0))
                        ])),
                Material(
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    splashColor: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent[400].withOpacity(0.5),
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/onlineorder.png",
                            width: 30,
                            height: 30,
                          ),
                          Text(
                            "Order",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            spreadRadius: 1,
                            blurRadius: 1.5,
                            offset: Offset(0, 0))
                      ]),
                ),
                Material(
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    splashColor: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.10,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent[400].withOpacity(0.5),
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/takeaway.png",
                            width: 30,
                            height: 30,
                          ),
                          Text(
                            "Take away",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
