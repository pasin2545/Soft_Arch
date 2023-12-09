
import 'package:softapp/pages/home.dart';
import 'package:softapp/pages/login.dart';
import 'package:softapp/pages/register.dart';
import 'package:softapp/pages/userdisplay.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: userdisplay(),
    );
  }
}