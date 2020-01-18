import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map data;
  List users;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    http.Response response =
        await http.get("http://test.chatongo.in/testdata.json");
    data = json.decode(response.body);
    setState(() {
      users = data["data"]['Records'];
      print(users[1]['title']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Welcome!'),
        backgroundColor: Color.fromRGBO(60, 131, 161, 1.0),
      ),
      body: ListView.builder(
        itemCount: users == null ? 0 : users.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                height: 350.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Color.fromRGBO(60, 131, 161, 1.0),
                        height: 130.0,
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment(0.0, -2.8),
                                child: Container(
                                  height: 95.0,
                                  width: 300,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Text(
                                              users[index]['title'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(right: 5.0),
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          users[index]['shortDescription'],
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.currencyInr,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              users[index]['collectedValue']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          'FUNDED',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.currencyInr,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              users[index]['totalValue']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          'GOALS',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              '36',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          'ENDS IN',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Color.fromRGBO(60, 131, 161, 1.0),
                        height: 130.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment(0.0, -3.0),
                              child: Container(
                                height: 95.0,
                                width: 95.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '100 %',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(11, 74, 92, 1.0),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              height: 40.0,
                              bottom: 10.0,
                              left: 10.0,
                              child: Container(
                                width: 80.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'PLEDGE',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                      users[index]['mainImageURL'],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
