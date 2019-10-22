import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
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
        title: Text("Asistente"),
      ),
      body: Center(
        child: 
          Text("Nada que ver aquí"),
      ),
    );
  }

}