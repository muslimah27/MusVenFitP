// import 'dart:html';

import 'package:flutter/material.dart';

import 'home.dart';

const List<String> _assetNames = <String>[
  // 'assets/notfound.svg', // unco            mment to test an asset that doesn't exist.
  'assets/icons/home1.svg',
  'assets/icons/jdwl.svg',
  'assets/icons/profile.svg',
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  get kBackgroundColor => null;

  get kTextColor => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Able Ballet App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}
