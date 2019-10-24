import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';
import 'package:flutter/material.dart';

class Tienda extends StatefulWidget {
  @override
  _TiendaState createState() => _TiendaState();
  Tienda({this.auth});
  final BaseAuth auth;
}

class _TiendaState extends State<Tienda> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(allTranslations.text('tab_store')),
      ),
      body: Center(
        child: 
          Text(allTranslations.text('message_nothing_here')),
      ),
    );
  }

}