import 'package:cease_reminder/screens/addstock.dart';
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
                      Navigator.of(context).push(createRoute(AddStock()));
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

   Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}