import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
/*
class Menu {
  Menu({this.id, this.img, this.header, this.body, this.price});

  final int id;
  final String img;
  final String header;
  final String body;
  final int price;

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json["id"],
      img: json["img"],
      header: json["header"],
      body: json["body"],
      price: json["price"],
    );
  }
}
*/

class Detail extends StatefulWidget {
  final String id = 'detail';
  Detail({Key key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List dataJson;

  Future<String> fetchMenu() async {
    http.Response result = await http.get(
        Uri.encodeFull('http://matanamart.dworkhub.com/menu.php'),
        headers: {"Accept": "application/json"});

    this.setState(() {
      dataJson = jsonDecode(result.body);
    });
  }

  @override
  void initState() {
    this.fetchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: GestureDetector(
        child: ListView.builder(
            itemCount: dataJson == null ? 0 : dataJson.length,
            itemBuilder: (context, index) {
              return Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.network(
                          dataJson[index]['img'],
                          width: 150.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 16.0),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                text: TextSpan(
                                  text: dataJson[index]['header'],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 12.0),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: dataJson[index]['body'],
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0, 12.0, 12.0, 0),
                                    child: Row(
                                      children: [
                                        Text('Rp.'),
                                        Text(dataJson[index]['price']
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  ButtonTheme(
                                    child: RaisedButton(
                                      color: Colors.green,
                                      child: Row(
                                        children: [
                                          Text(
                                            'USE PROMO',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.red,
                              thickness: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
