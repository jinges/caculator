/*
 * @Author: 大明冯;
 * @Date: 2019-10-22 20:17:39;
 * @Last Modified by:   大明冯;
 * @Last Modified time: 2019-10-22 20:17:39;
 */

import 'dart:html';

import 'package:flutter/material.dart';

class Keyboard extends StatefulWidget {
  Keyboard({Key key}) : super(key: key);

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  static const rowOne = ['C', '()', '%', '/'];
  static const rowTwo = ['7', '8', '9', '*'];
  static const rowThree = ['4', '5', '6', '+'];
  static const rowFour = ['1', '2', '3', '+'];
  static const rowFive = ['-', '0', '.', '='];
  static const operators = [...rowOne, ...rowTwo, ...rowThree, ...rowFour, ...rowFive];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 1.16),
          children: operators.map((item) =>
            KeyBoard(keyText: item)
          ).toList()));
  }
}

class KeyBoard extends StatefulWidget {
  final String keyText;
  KeyBoard({Key key, this.keyText}) : super(key: key);

  @override
  _KeyBoardState createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        widget.keyText,
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.white
        ),
      ),
      onPressed: () {
        var str = widget.keyText;
        print('$str');
      },
    );
  }
}
