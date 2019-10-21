import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
  Menu({this.auth});
  final BaseAuth auth;



}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Banana"),
      leading: new IconButton(
      icon: new Icon(Icons.arrow_back, color: Colors.black),
      onPressed: (){
        widget.auth.signOut();
          Navigator.of(context).popUntil((route) => route.isFirst);
      },)),
      body: Container(child: Text("Puto"),),
    );
  }
}