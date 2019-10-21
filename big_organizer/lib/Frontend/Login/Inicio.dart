import 'package:big_organizer/Frontend/Login/Login.dart';
import 'package:big_organizer/Frontend/Login/Register.dart';
import 'package:flutter/material.dart';
import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';

class Inicio extends StatelessWidget {
  Inicio({this.auth});
  final BaseAuth auth;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      children: <Widget>[
        _logo(),
        _titulo(),
        _login(context),
        _register(context)
      ],
    ));
  }

  Widget _logo() {
    return new Container(
      padding: EdgeInsets.only(top: 40),
      child: Image.asset(
        'assets/icons/app_icon.png',
        height: 200,
      ),
    );
  }

  Widget _titulo() {
    return new Container(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "Big Organizer",
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        textScaleFactor: 5,
      ),
    );
  }

  Widget _login(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(top: 70),
        child: RaisedButton(
          child: Text(
            "Iniciar Sesion",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login(auth: auth)),
            );
          },
        ));
  }

  Widget _register(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(top: 30),
        child: RaisedButton(
          child: Text(
            "Registrarse",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register(auth: auth,)),
            );
          },
        ));
  }
}
