import 'dart:async';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cease_reminder/database/database.dart';
import 'package:cease_reminder/dashboard/dashboard.dart';
import 'package:cease_reminder/screens/addstock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String payld;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
    _checkExpiry();
    Timer.periodic(new Duration(minutes: 10), (timer) {
      _checkExpiry();
    });
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
      await showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Expiry alert'),
        content: new Text('$payload'),
      ),
    );
    }
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin
        .show(0, 'Expiry alert', 'show', platform, payload: payld);
  }

  void _checkExpiry() async {
    final database = Provider.of<AppDatabase>(context, listen: false);
    var datas = await database.watchAllData();
    String pay = "";
    var today = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print(today);
    for (var data in datas) {
      var date = DateFormat("yyyy-MM-dd")
          .format(DateFormat("dd-MM-yyyy").parse(data.exp_date));
          print(date);
          print(DateTime.parse(date).difference(DateTime.parse(today)).inDays);
      if(DateTime.parse(date).difference(DateTime.parse(today)).inDays < 10){
        pay = pay + data.item;
         pay = pay + '\n';
        print(data.item);
      }
    }
    setState(() {
      payld = pay;
    });
    showNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "CEASE REMINDER",
            style: TextStyle(color: Colors.white),
          ),
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
                    color: Colors.green,
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
                        Navigator.of(context).push(createRoute(DashBoard()));
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
