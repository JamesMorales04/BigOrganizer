import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:big_organizer/Backend/Obtener/Obtener_usuario.dart';
import 'package:big_organizer/Backend/Tablas/Asistente.dart' as asistente_tabla;
import 'package:big_organizer/Frontend/Calendario/Calendario.dart';
import 'package:big_organizer/Frontend/Menu/Settings.dart';
import 'package:big_organizer/Frontend/Actividades/Actividades.dart';
import 'package:big_organizer/Frontend/Tienda/Tienda.dart';
import 'package:big_organizer/Frontend/Asistente/Asistente.dart' as asistente_menu;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
  Menu({this.auth,this.userId});
  final BaseAuth auth;
  final userId;
}

class _MenuState extends State<Menu> {

  Widget _activities(){
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonTheme(
          minWidth: 300.0,
          height: 200.0,
          child: 
            FlatButton.icon(
            color: Color.fromARGB(255, 63, 169, 245),
            //icon: Icon(Icons.assessment, color: Colors.white, size: 80), //`Icon` to display
            icon: ImageIcon(AssetImage("assets/icons/activities_icon.png"), size: 50, color:Colors.white),
            label: Text('Actividades', style: TextStyle(color: Colors.white, fontSize: 32)), //`Text` to display
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Actividades()),
                );
              },
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          ),
        ),
      ],
    );
  }

  Widget _calendar(){
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonTheme(
          minWidth: 300.0,
          height: 150.0,
          child: 
            FlatButton.icon(
            color: Color.fromARGB(255, 63, 169, 245),
            icon: ImageIcon(AssetImage("assets/icons/calendar_icon.png"), size: 50, color:Colors.white), //`Icon` to display
            label: Text('Calendario', style: TextStyle(color: Colors.white, fontSize: 32)), //`Text` to display
            onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Calendario()),
                );
              },
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          ),
        ),
      ],
    );
  }

  Widget _tienda(){
    return new ButtonTheme(
      minWidth: 200.0,
      height: 100.0,
      child: FlatButton.icon(
          color: Color.fromARGB(255, 63, 169, 245),
          icon: ImageIcon(AssetImage("assets/icons/store_icon.png"), size: 50, color:Colors.white), //`Icon` to display
          label: Text('Tienda', style: TextStyle(color: Colors.white)), //`Text` to display
          onPressed: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Tienda()),
                );
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ),
    );
  }

  Widget _ajustes(){
    return new ButtonTheme(
      padding: EdgeInsets.only(top: 10),
      minWidth: 200.0,
      height: 100.0,
      child: FlatButton.icon(
          color: Color.fromARGB(255, 63, 169, 245),
          icon: ImageIcon(AssetImage("assets/icons/settings_icon.png"), size: 50, color:Colors.white), //`Icon` to display
          label: Text('Ajustes', style: TextStyle(color: Colors.white)), //`Text` to display
          onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Settings(auth: widget.auth)),
              );
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ),
    );
  }

  Widget _asistente(){
    return new ButtonTheme(
      minWidth: 150.0,
      height: 200.0,
      child: FlatButton.icon(
          color: Color.fromARGB(255, 63, 169, 245),
          icon: ImageIcon(AssetImage("assets/icons/assistant_icon.png"), size: 50, color:Colors.white), //`Icon` to display
          label: Text('Asistente', style: TextStyle(color: Colors.white)), //`Text` to display
          onPressed: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => asistente_menu.Asistente()),
                );
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.userId);
    return new StreamBuilder(
      stream:Firestore.instance.collection("Usuario").document(widget.userId).snapshots() ,
      builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container();
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container();
            default:
              return menu(snapshot.data);
          }
        }
    );
  }

  Widget menu(DocumentSnapshot document){
    String name=document['name'];
    return new Scaffold(
      appBar: new AppBar(
          title: Text(name),
          automaticallyImplyLeading: false),
      body: Center(
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _activities(),
              _calendar(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _tienda(),
                      _ajustes(),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      _asistente(),
                    ],
                  ),
                ],
              ),
              Text("Mensaje / dato curioso")
            ]
        ),
      ),
    );
  }


}

