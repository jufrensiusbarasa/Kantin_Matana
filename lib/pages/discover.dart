import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:matanamart/pages/detail.dart';

class Discover extends StatefulWidget {
  String id = 'discover';
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Kantin Matana'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Welcome, Matananian',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                      ),
                      CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                            autoPlay: true,
                            //enlargeCenterPage: true,
                            viewportFraction: 1.0,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: slider.map((url) {
                          int index = slider.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(255, 0, 0, 1)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonTheme(
                            child: RaisedButton(
                              color: Colors.green,
                              child: Row(
                                children: [
                                  Text(
                                    'FREE DELIVERY',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              onPressed: () {},
                            ),
                            height: 50.0,
                          ),
                          ButtonTheme(
                            child: RaisedButton(
                              color: Colors.indigo,
                              child: Row(
                                children: [
                                  Text(
                                    'TAKEAWAY',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              onPressed: () {},
                            ),
                            height: 50.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Promotions',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'See all ',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.indigo,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    Navigator.pushNamed(context, Detail().id),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                      ),
                      Container(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 0.5,
                            aspectRatio: 2.0,
                          ),
                          items: promotions
                              .map((item) => Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 5.0,
                                        right: 5.0,
                                      ),
                                      child: Image.network(
                                        item,
                                        fit: BoxFit.fill,
                                        width: 1000.0,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 3.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 32.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Value Deals',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'See all ',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.indigo,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    Navigator.pushNamed(context, Detail().id),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                      ),
                      Container(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 0.5,
                            aspectRatio: 2.0,
                          ),
                          items: valueDeals
                              .map((item) => Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 5.0,
                                        right: 5.0,
                                      ),
                                      child: Image.network(
                                        item,
                                        fit: BoxFit.fill,
                                        width: 1000,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 3.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 32.0),
                      ),
                      Row(
                        children: [
                          Text(
                            'Explore from Categories',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/minuman.png',
                                    height: 100.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.7),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () =>
                                    Navigator.pushNamed(context, Detail().id),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.0),
                              ),
                              Center(
                                child: Text(
                                  'Minuman',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/makanan.png',
                                    height: 100.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.7),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () =>
                                    Navigator.pushNamed(context, Detail().id),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.0),
                              ),
                              Center(
                                child: Text(
                                  'Makanan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/snacks.png',
                                    height: 100.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.7),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () =>
                                    Navigator.pushNamed(context, Detail().id),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.0),
                              ),
                              Center(
                                child: Text(
                                  'Snacks',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Slider
final List<String> slider = [
  'http://matanamart.dworkhub.com/media/slide_001.png',
  'http://matanamart.dworkhub.com/media/slide_002.png',
  'http://matanamart.dworkhub.com/media/slide_003.png',
  'http://matanamart.dworkhub.com/media/slide_004.png',
];

final List<Widget> imageSliders = slider
    .map((imgSlider) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      imgSlider,
                      fit: BoxFit.fill,
                      width: 1000.0,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        /*
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),*/
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
//End of Slider

//Promotions
final List<String> promotions = [
  'http://matanamart.dworkhub.com/media/pr_001.png',
  'http://matanamart.dworkhub.com/media/pr_002.png',
  'http://matanamart.dworkhub.com/media/pr_003.png',
  'http://matanamart.dworkhub.com/media/pr_004.png',
  'http://matanamart.dworkhub.com/media/pr_005.png',
  'http://matanamart.dworkhub.com/media/pr_006.png',
];

final List<Widget> promotionsSlider = promotions
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item,
                      fit: BoxFit.fill,
                      width: 1000.0,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        /*
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),*/
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
//End of Promotions

//Value Deails
final List<String> valueDeals = [
  'http://matanamart.dworkhub.com/media/vd_001.png',
  'http://matanamart.dworkhub.com/media/vd_002.png',
  'http://matanamart.dworkhub.com/media/vd_003.png',
  'http://matanamart.dworkhub.com/media/vd_004.png',
  'http://matanamart.dworkhub.com/media/vd_005.png',
];

final List<Widget> vdSlider = valueDeals
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item,
                      fit: BoxFit.fill,
                      width: 1000.0,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        /*
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),*/
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
//End of Value Deails
