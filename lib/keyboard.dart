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
  static const rowOne = ['C', '()', '%', '/'];
  static const rowTwo = ['7', '8', '9', '*'];
  static const rowThree = ['4', '5', '6', '-'];
  static const rowFour = ['1', '2', '3', '+'];
  static const rowFive = ['-', '0', '.', '='];
  static const operators = [...rowOne, ...rowTwo, ...rowThree, ...rowFour, ...rowFive];

  var keyList = [];

  void _getKey(key){
    print('$keyList');
    print(keyList.lastIndexOf('+'));

    if(key == 'C') {
      print(keyList.removeLast());
    } else {
      keyList.add(key);
    }
    print('$keyList');
    
    try{
      print(double.parse(keyList.join('')));
      print('====================');
    } catch(e){
      print('$e');
    }
    setState(() {
      
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
    return FlatButton(
      child: Text(
        widget.keyText,
        style: TextStyle(
          fontSize: 32.0,
          color: Colors.white
        ),
      ),
      onPressed: _getKey,
    );
  }
}
