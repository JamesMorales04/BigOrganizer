import 'package:big_organizer/Backend/Envio/Envio_frases.dart';
import 'package:big_organizer/Frontend/Login/Login.dart';
import 'package:big_organizer/Frontend/Login/Register.dart';
import 'package:flutter/material.dart';
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';
import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';

class Inicio extends StatefulWidget{
  Inicio({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _InicioState();
}

class _InicioState extends State<Inicio> {

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
    String valor = allTranslations.text('button_language');
    return new Container(
      padding: EdgeInsets.only(top: 10),
      child: new DropdownButton<String>(
            hint: Text(valor),
            items: <String>['English', 'Español', 'Português'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              valor = value;
              allTranslations.setNewLanguage(value);
              setState((){});
            },
          ),
    );
  }

  Widget _help() {
    return new FlatButton(
      padding: EdgeInsets.only(top: 10),
      onPressed: null,
      child:Text(allTranslations.text('button_help'),style: TextStyle(color: Colors.blue),)
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
      child: Text(allTranslations.text('message_alternative_login')),
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
        allTranslations.text('app_title'),
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
            allTranslations.text('button_login'),
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(255, 63, 169, 245),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login(auth: widget.auth)),
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
            allTranslations.text('button_register'),
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(255, 63, 169, 245),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register(auth: widget.auth,)),
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
