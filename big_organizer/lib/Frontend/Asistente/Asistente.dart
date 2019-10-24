import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';
import 'package:flutter/material.dart';

class Asistente extends StatefulWidget {
  @override
  _AsistenteState createState() => _AsistenteState();
  Asistente({this.auth});
  final BaseAuth auth;
}

class _AsistenteState extends State<Asistente> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(allTranslations.text('tab_assistant')),
      ),
      body: Center(
        child: 
          Text(allTranslations.text('message_nothing_here')),
      ),
    );
  }

}