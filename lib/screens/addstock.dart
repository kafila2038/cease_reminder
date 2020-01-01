import 'package:flutter/material.dart';

class addstock extends StatefulWidget {
  addstock({Key key}) : super(key: key);
  @override
  addstockState createState() => addstockState();
}

class  addstockState extends State<addstock> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title:
      Text("Add Stock",
      style: TextStyle(color: Colors.deepOrange[300]),
      ),
      ),
      body:ListView(children: <Widget>[

      ],)
       },
      ),

  }
}