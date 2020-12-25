import 'package:flutter/material.dart';
import 'package:matanamart/pages/home.dart';
import 'package:matanamart/pages/discover.dart';
import 'package:matanamart/pages/near-by.dart';
import 'package:matanamart/pages/detail.dart';

void main() => runApp(Matanamart());

class Matanamart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Matanamart',
      initialRoute: Home().id,
      routes: {
        Discover().id: (BuildContext context) => Discover(),
        Detail().id: (BuildContext context) => Detail(),
        NearBy().id: (BuildContext context) => NearBy(),
        Home().id: (BuildContext context) => Home(),
      },
    );
  }
}
