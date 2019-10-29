/*
 * @Author: 大明冯 
 * @Date: 2019-10-22 17:31:43 
 * @Last Modified by: 大明冯
 * @Last Modified time: 2019-10-29 15:18:38
 */

import 'package:flutter/material.dart';

class ScreenWidget extends StatefulWidget {
  final String equation;
  final String result;
  ScreenWidget({Key key, this.equation, this.result}) : super(key: key);

  @override
  _ScreenWidgetState createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text(
            widget.equation,
            textAlign: TextAlign.right,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white70,
              fontSize: 30.0,
            ),
          ),
          Text(
            widget.result,
            textAlign: TextAlign.right,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 50.0,
            ),
          )
        ],
      ),
    );
  }
}