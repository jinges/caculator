import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
        primarySwatch: Colors.purple,
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
  List<String> keyList = [];
  String _equation = '';
  String _result = '';
  Parser p = Parser();
  RegExp numReg = RegExp(r'[\d\.]');
  RegExp operReg = RegExp(r'[\+\-|*\/\.]');

  String _cumputeRes(keyList){
    Expression exp = p.parse(keyList.join(''));
    String result = exp.evaluate(EvaluationType.REAL, null).toString();
    return result;
  }

  void _getKeyStr(key) {
    _result = '';

    if (key == 'C') {
      keyList.clear();
      _equation = '';
    } else {
      if (key == '=') {
        //清空表达式，得到结果,不用追加最后的“=”
        _equation = _cumputeRes(keyList);
        keyList.clear();
      } else if (numReg.hasMatch(key)) {
        //按下数字
        keyList.add(key);
        _equation = keyList.join('');
      } else {
        //运算符，非number
        //最后一个字符是运算符，不处理
        var lastNum = keyList.last;
        if(operReg.hasMatch(lastNum) && key != '()') {
          return;
        }
        if(operReg.hasMatch(keyList.join(''))) {
          //存在运算符,可以计算结果
          _result = _cumputeRes(keyList);
        }
        keyList.add(key);
        _equation = keyList.join('');
      }
    }
    setState(() {
      _equation = _equation;
      _result = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Flex(
        direction: Axis.vertical,
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
            child: KeyBoardWidget(onChange: _getKeyStr),
          ),
        ],
      ),
    );
  }
}
