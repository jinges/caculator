/*
 * @Author: 大明冯 
 * @Date: 2019-10-22 17:31:43 
 * @Last Modified by: 大明冯
 * @Last Modified time: 2019-10-22 21:40:55
 */

import 'package:flutter/material.dart';

class ScreenWidget extends StatefulWidget {
  ScreenWidget({Key key}) : super(key: key);

  @override
  _ScreenWidgetState createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text(
            '10',
            textAlign: TextAlign.right,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 40.0,
            ),
          ),
          Text(
            '12',
            textAlign: TextAlign.right,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}