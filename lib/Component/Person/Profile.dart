import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sửa thông tin"),
        centerTitle: true,
        // backgroundColor: Colors.redAccent,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Container(
          //     // decoration: BoxDecoration(
          //     //   gradient: LinearGradient(
          //     //       begin: Alignment.topCenter,
          //     //       end: Alignment.bottomCenter,
          //     //       colors: [Colors.blue, Colors.pink[200]]),
          //     // ),
          //     // child: Container(
          //     //   width: double.infinity,
          //     //   height: 350.0,
          //     //   child: Center(
          //     //     child: Column(
          //     //       crossAxisAlignment: CrossAxisAlignment.center,
          //     //       mainAxisAlignment: MainAxisAlignment.center,
          //     //       children: <Widget>[
          //     //         CircleAvatar(
          //     //           backgroundImage: NetworkImage(
          //     //             "https://i.imgur.com/7dbiqsi.png",
          //     //           ),
          //     //           radius: 75,
          //     //         ),
          //     //         SizedBox(height: 10),
          //     //         Text(
          //     //           "Phượng Quỳnh",
          //     //           style: TextStyle(
          //     //               fontSize: 25,
          //     //               color: Colors.white,
          //     //               fontWeight: FontWeight.bold),
          //     //         ),
          //     //         Card(
          //     //           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          //     //           clipBehavior: Clip.antiAlias,
          //     //           elevation: 5,
          //     //           child: Padding(
          //     //               padding:
          //     //                   EdgeInsets.symmetric(horizontal: 8, vertical: 22),
          //     //               child: Row(
          //     //                 children: <Widget>[
          //     //                   Expanded(
          //     //                     child: Column(
          //     //                       children: <Widget>[
          //     //                         Text("Số điện thoại",
          //     //                             style: TextStyle(
          //     //                                 fontSize: 15,
          //     //                                 fontWeight: FontWeight.bold)),
          //     //                         SizedBox(height: 10),
          //     //                         Text("0348845163")
          //     //                       ],
          //     //                     ),
          //     //                   ),
          //     //                   Expanded(
          //     //                     child: Column(
          //     //                       children: <Widget>[
          //     //                         Text("Tên đăng nhập",
          //     //                             style: TextStyle(
          //     //                                 fontSize: 15,
          //     //                                 fontWeight: FontWeight.bold)),
          //     //                         SizedBox(height: 10),
          //     //                         Text("hieuitute")
          //     //                       ],
          //     //                     ),
          //     //                   ),
          //     //                   Expanded(
          //     //                     child: Column(
          //     //                       children: <Widget>[
          //     //                         Text("Sinh nhật",
          //     //                             style: TextStyle(
          //     //                                 fontSize: 15,
          //     //                                 fontWeight: FontWeight.bold)),
          //     //                         SizedBox(height: 10),
          //     //                         Text("20/10/1999")
          //     //                       ],
          //     //                     ),
          //     //                   ),
          //     //                 ],
          //     //               )),
          //     //         ),
          //     //       ],
          //     //     ),
          //     //   ),
          //     // ),
          //     ),
          SizedBox(height: 20),

          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Số điện thoại:",
                  style: TextStyle(fontSize: 14),
                  // textAlign: TextAlign.start,
                ),
              ),
              TextFormField(
                style: TextStyle(fontSize: 25),
                decoration: new InputDecoration(
                  //hintText: "Số điện thoại: ",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor.withOpacity(0.2),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  prefixIcon:
                      Icon(Icons.phone, color: Theme.of(context).accentColor),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Ngày sinh:",
                  style: TextStyle(fontSize: 14),
                  // textAlign: TextAlign.start,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                style: TextStyle(fontSize: 25),
                decoration: new InputDecoration(
                  //hintText: "Số điện thoại: ",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor.withOpacity(0.2),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  prefixIcon: Icon(Icons.alarm_on,
                      color: Theme.of(context).accentColor),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text("Lưu thay đổi",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                onPressed: () {
                  // TODO: Post method
                }),
          )
        ],
      ),
    );
  }
}
