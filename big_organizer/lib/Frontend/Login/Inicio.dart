import 'package:big_organizer/Backend/Envio/Envio_frases.dart';
import 'package:big_organizer/Frontend/Login/Login.dart';
import 'package:big_organizer/Frontend/Login/Register.dart';
import 'package:flutter/material.dart';
import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';

class Inicio extends StatelessWidget {
  Inicio({this.auth});
  final BaseAuth auth;
  @override
  Widget build(BuildContext context) {
    Envio_frases envio = new Envio_frases(frases: "Un buen trabajo es una buena vida");
    envio.addNewdfrase();
    
    return new Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      children: <Widget>[
        _logo(),
        _titulo(),
        _login(context),
        _register(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            _otros_inicios_texto(),
            _otros_inicios_google(),
            _otros_inicios_facebook()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _lenguaje(),
            _help()
          ],
        ),
        _company(context)
      ],
    ));
  }


  

  Widget _lenguaje() {
    return new Container(
      padding: EdgeInsets.only(top: 10),
      child:Text("Lenguaje",)
    );
  }

  Widget _help() {
    return new FlatButton(
      padding: EdgeInsets.only(top: 10),
      child:Text("Help!",style: TextStyle(color: Colors.blue),)
    );
  }

  Widget _otros_inicios_google() {
    return new Container(
      padding: EdgeInsets.only(top: 10),
      child: IconButton(
        icon: Image.asset('assets/icons/google.png'),
        onPressed: (){},
      ),
    );
  } 

  Widget _otros_inicios_facebook() {
    return new Container(
      padding: EdgeInsets.only(top: 10),
      child: IconButton(
        icon: Image.asset('assets/icons/facebook.png'),
        onPressed: (){},
      ),
    );
  } 

  Widget _otros_inicios_texto() {
    return new Container(
      padding: EdgeInsets.only(top: 10),
      child: Text('O ingresa con'),
    );
  } 

  Widget _logo() {
    return new Container(
      padding: EdgeInsets.only(top: 70),
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
        textScaleFactor: 3,
      ),
    );
  }

  Widget _login(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(top: 100),
        child: RaisedButton(
          child: Text(
            "Iniciar Sesion",
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(255, 63, 169, 245),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login(auth: auth)),
            );
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ));
  }

  Widget _register(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(top: 15),
        child: RaisedButton(
          child: Text(
            "Registrarse",
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(255, 63, 169, 245),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register(auth: auth,)),
            );
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ));
  }

  Widget _company(BuildContext context) {
    return new Container(
      alignment: Alignment.bottomCenter,
      padding:EdgeInsets.only(top: 150),
        child: Text("Hestia Development")
        );
  }
}
