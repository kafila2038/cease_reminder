import 'package:cease_reminder/screens/homepage.dart';
import 'package:cease_reminder/screens/homepage1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

TextEditingController userid = TextEditingController();
TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
              0.1,
              0.4,
              0.7,
              0.9
            ],
                colors: [
              Colors.purple[400],
              Colors.purple[300],
              Colors.blue[200],
              Colors.blue[100],
            ])),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                "assets/cr_logo.jpg",
                height: 50.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: userid,
                      validator: (Value) {
                        if (Value.isEmpty) {
                          return "Please enter the username";
                        }
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: password,
                      validator: (Value) {
                        if (Value.isEmpty) {
                          return "Please enter the password";
                        }
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: 200.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      if(userid.text == 'admin' && password.text == 'Admin@123'){
                          Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      }
                      else if(userid.text == 'user' && password.text == 'User@123')
                      {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage1()));
                      }
                      else{
                         Toast.show("Enter valid username or password", context,
                duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                      }
                    } else {
                     Toast.show("Error", context,
                duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                    }
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.black),
                    textScaleFactor: 1.2,
                  ),
                  color: Colors.cyan[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
