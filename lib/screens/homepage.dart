import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cease Remainder",
      style: TextStyle(color: Colors.white),),
      ),

    body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 55.0,
                  width: 150.0,
                  color: Colors.blueAccent,
                  child: RaisedButton(
                    elevation: 0,
                    textColor: Colors.white,
                    splashColor: Colors.amber,
                    disabledColor: Colors.grey,
                    child: Text(
                      "Add Stock",
                      textScaleFactor: 1.6,
                    ),
                    color: Colors.blueAccent,
                    onPressed: () async {
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    height: 55.0,
                    width: 150.0,
                    color: Colors.red,
                    child: RaisedButton(
                      elevation: 0,
                      textColor: Colors.white,
                      splashColor: Colors.amber,
                      disabledColor: Colors.grey,
                      child: Text(
                        "Dashboard",
                        textScaleFactor: 1.6,
                      ),
                      color: Colors.red,
                      onPressed: () async {
                      },
                    )),
              ]),
    ));
  }
}