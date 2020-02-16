import 'package:cease_reminder/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login/login.dart';
import 'package:cease_reminder/database/database.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_)=>AppDatabase(),
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginScreen(),
    )
    );
  }
}

