import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
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
        title: Text("Tienda"),
      ),
      body: Center(
        child: 
          Text("Nada que ver aquí"),
      ),
    );
  }

}