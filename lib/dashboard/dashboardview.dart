import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cease_reminder/database/database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class DashBordView extends StatefulWidget {
  final String title ;
  DashBordView({Key key,this.title}) : super(key: key);

  @override
  _DashBordViewState createState() => _DashBordViewState();
}

class _DashBordViewState extends State<DashBordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title,
      style: TextStyle(color: Colors.white),),
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
      stream: database.getAllData(widget.title),
      builder: (context, AsyncSnapshot<List<Reminder>> snapshot) {
        final reminderData = snapshot.data ?? List();
        return ListView.builder(
          itemCount: reminderData.length,
          itemBuilder: (_, index) {
            final itemTask = reminderData[reminderData.length - index - 1];
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    database.deleteTask(itemTask);
                  },
                )
              ],
              child: ListTile(
                title: Text(itemTask.item),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text(itemTask.exp_date),
                  Text(itemTask.qty),
                ],),
              ),
            );
          },
        );
      },
    );
  }
}