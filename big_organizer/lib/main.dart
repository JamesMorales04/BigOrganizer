import 'package:big_organizer/Frontend/Login/Inicio.dart';
import 'package:big_organizer/Frontend/Login/Login.dart';
import 'package:big_organizer/Frontend/Login/Register.dart';
import 'package:flutter/material.dart';
import 'package:big_organizer/Backend/Autenticacion/Creacion/Auth.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Big Organizer',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Inicio(auth: new Auth()));
  }
}
