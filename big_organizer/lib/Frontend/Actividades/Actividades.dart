import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';
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
        title: Text(allTranslations.text('tab_activities')),
      ),
      body: Center(
        child: 
          Text(allTranslations.text('message_nothing_here')),
      ),
    );
  }

}