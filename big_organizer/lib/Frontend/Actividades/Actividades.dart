import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:flutter/material.dart';

class Actividades extends StatefulWidget {
  @override
  _ActividadesState createState() => _ActividadesState();
  Actividades({this.auth});
  final BaseAuth auth;
}

class _ActividadesState extends State<Actividades> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actividades"),
      ),
      body: Center(
        child: 
          Text("Nada que ver aquí"),
      ),
    );
  }

}