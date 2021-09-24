import 'package:flutter/material.dart';
import 'package:mail_sample/HomePage.dart';
import 'HomePage.dart';

void main() =>
  runApp(const MyApp());


  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  theme: ThemeData(
  primarySwatch: Colors.blue,
  ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  );
  }
  }
