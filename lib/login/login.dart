import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1,0.4,0.7,0.9],
            colors: [
              Colors.purple[600],
              Colors.purple[500],
              Colors.purple[300],
              Colors.purple[200],
            ])
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[Image.asset("assets/cr_logo.jpg",
            height: 50.0,),
            
            SizedBox(height: 50.0,),

            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle,color: Colors.white,),
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),

            SizedBox(height: 30.0,),

            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock,color: Colors.white,),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.white70),
              ),
              obscureText: true,
            ),

           SizedBox(height: 50.0,),

           Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1,0.4,0.7,0.9],
            colors: [
              Colors.purple[700],
              Colors.purple[500],
              Colors.purple[500],
              Colors.purple[600],
            ])
        ),
        child: ButtonTheme(buttonColor: Colors.white10,
        height: 50.0,
        minWidth: double.infinity,
        child: RaisedButton(
          onPressed: (){},
          child: Text("LOGIN",style: TextStyle(color: Colors.white),),
        ),),
           ),
          

            ],
          ),
        ),
      ),
    );
  }
}