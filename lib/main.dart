import 'dart:html';

import 'package:flutter/material.dart';

import './screen.dart';
import './keyboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _equation = '';
  String _result = '';

  void _computeRes(String res){
    setState(() {
      _equation = res;
      _result = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Flex(
        direction:  Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ScreenWidget(equation: _equation, result: _result),
          ),
          Container(
            height: 1.0,
            color: Colors.white,
          ),
          Expanded(
            flex: 2,
            child: KeyBoardWidget(onChange: _computeRes),
          ),
        ],
       ),
    );
  }
}
