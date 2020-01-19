import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cease_reminder/database/database.dart';
import 'dashboardview.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dash Board",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Expanded(
            child: _buildList(context),
          )
        ]),
      ),
    );
  }

  StreamBuilder<List<Reminder>> _buildList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllData(),
      builder: (context, AsyncSnapshot<List<Reminder>> snapshot) {
        final attendenceData = snapshot.data ?? List();
        return ListView.builder(
          itemCount: attendenceData.length,
          itemBuilder: (_, index) {
            final itemTask = attendenceData[index];
            return ListTile(
              title: Text(itemTask.company),
              onTap: () {
                Navigator.of(context).push(createRoute(DashBordView(title: itemTask.company,)));
              },
            );
          },
        );
      },
    );
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
