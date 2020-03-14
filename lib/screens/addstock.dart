import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';
import 'package:cease_reminder/database/database.dart';
class AddStock extends StatefulWidget {
  AddStock({Key key}) : super(key: key);
  @override
  AddStockState createState() => AddStockState();
}

class AddStockState extends State<AddStock> {
  var _formkey = GlobalKey<FormState>();
  bool _validate = false, _buttonEnabled = true;
  String _date = "Expiry Date";

  TextEditingController _company = TextEditingController();
  TextEditingController _item = TextEditingController();
  TextEditingController _qty = TextEditingController();

  DateTime selectedDate = DateTime.now().subtract(Duration(days: 30));

  Future<Null> _selectDate(BuildContext context, selectedDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (selectedDate == "selectedDate") {
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          _date = "${DateFormat("dd-MM-yyyy").format(selectedDate.toLocal())}";
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.body2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Stock",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
          key: _formkey,
          autovalidate: _validate,
          child: Center(
              child: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
            SizedBox(
              height: 150.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: textStyle,
                controller: _company,
                validator: _validatefield,
                decoration: InputDecoration(
                    labelText: "Company",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                onChanged: (value) {
                  setState(() {
                    _buttonEnabled = true;
                  });
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  style: textStyle,
                  keyboardType: TextInputType.text,
                  controller: _item,
                  validator: _validatefield,
                  decoration: InputDecoration(
                      labelText: "Item",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  onChanged: (value) {
                    setState(() {
                      _buttonEnabled = true;
                    });
                  },
                )),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        _selectDate(context, "selectedDate");
                      },
                      child: Text(_date),
                      elevation: 0,
                      color: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    height: 60.0,
                    width: 160.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: textStyle,
                          controller: _qty,
                          validator: _validatefield,
                          decoration: InputDecoration(
                              labelText: "Quantity",
                              labelStyle: textStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          onChanged: (value) {
                            setState(() {
                              _buttonEnabled = true;
                            });
                          },
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]))),
      bottomNavigationBar: Container(
          height: 55.0,
          color: _buttonEnabled ? Color(0xff0ccda3) : Colors.grey,
          child: RaisedButton(
              elevation: 0,
              textColor: Colors.white,
              splashColor: Colors.orange,
              disabledColor: Colors.grey,
              child: Text(
                "Add",
                textScaleFactor: 1.6,
                style: TextStyle(color: Colors.black),
              ),
              color: Color(0xff0ccda3),
              onPressed: _buttonEnabled
                  ? () {
                      setState(() {
                        _validate = true;
                        _buttonEnabled = false;
                      });
                      if (_formkey.currentState.validate()) {
                        final database = Provider.of<AppDatabase>(context, listen: false);
                      final data = Reminder(
                        company: _company.text,
                        item: _item.text,
                        exp_date: _date.toString(),
                        qty: _qty.text, id: null
                      );
                      database.insertTask(data);
                      Toast.show("Added", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                        setState(() {
                          _reset();
                        });
                      }
                    }
                  : null)),
    );
  }

  void _reset() {
    _company.text = '';
    _item.text = '';
    _qty.text = '';
    setState(() {
      _validate = false;
      _date = "Expiry Date";
      _buttonEnabled = true;
    });
  }

  String _validatefield(String value) {
    if (value.isEmpty) {
      return 'Please enter valid Input';
    }
  }
}
