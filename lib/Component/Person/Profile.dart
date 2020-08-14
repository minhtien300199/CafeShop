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
        title: Text("Thông tin cá nhân"),
        centerTitle: true,
        // backgroundColor: Colors.redAccent,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.pink[200]]),
            ),
            child: Container(
              width: double.infinity,
              height: 350.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://i.imgur.com/7dbiqsi.png",
                      ),
                      radius: 75,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Phượng Quỳnh",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      clipBehavior: Clip.antiAlias,
                      elevation: 5,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 22),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text("Số điện thoại",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Text("0348845163")
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text("Tên đăng nhập",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Text("hieuitute")
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text("Sinh nhật",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Text("20/10/1999")
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
