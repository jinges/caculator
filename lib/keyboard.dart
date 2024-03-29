/*
 * @Author: 大明冯;
 * @Date: 2019-10-22 20:17:39;
 * @Last Modified by:   大明冯;
 * @Last Modified time: 2019-10-22 20:17:39;
 */

import 'dart:html';
import 'package:flutter/material.dart';

class KeyBoardWidget extends StatefulWidget {
  KeyBoardWidget({Key key, @required this.onChange}) : super(key: key);
  final onChange;
 
  @override
  _KeyBoardWidgetState createState() => _KeyBoardWidgetState();
}

class _KeyBoardWidgetState extends State<KeyBoardWidget> {
  static const rowOne = ['CE', 'C', '‹', '÷'];
  static const rowTwo = ['7', '8', '9', '×'];
  static const rowThree = ['4', '5', '6', '-'];
  static const rowFour = ['1', '2', '3', '+'];
  static const rowFive = ['±', '0', '.', '='];
  static const operators = [...rowOne, ...rowTwo, ...rowThree, ...rowFour, ...rowFive];

  // var keyList = [];
  // Parser p = new Parser();

  void _getKey(key){
    setState(() {
      widget.onChange(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 1.1),
          children: operators.map((item) =>
            KeyBoard(keyText: item, getKey: _getKey)
          ).toList()));
  }
}

class KeyBoard extends StatefulWidget {
  final String keyText;
  final getKey;
  KeyBoard({Key key, this.keyText, @required this.getKey}) : super(key: key);

  @override
  _KeyBoardState createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  void _getKey(){
    var str = widget.keyText;
    widget.getKey(str);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        widget.keyText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32.0,
          decoration: TextDecoration.none,
          color: Colors.white,
        ),
      ),
      onTap: _getKey,
    );
  }
}
