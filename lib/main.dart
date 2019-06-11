import 'package:flutter/material.dart';

import 'homepage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Interest Calculator App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}