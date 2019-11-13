import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:big_organizer/Frontend/Calendario/Calendario.dart';
import 'package:big_organizer/Frontend/Menu/Settings.dart';
import 'package:big_organizer/Frontend/Actividades/Actividades.dart';
import 'package:big_organizer/Frontend/Tienda/Tienda.dart';
import 'package:big_organizer/Frontend/Asistente/Asistente.dart' as asistente_menu;
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';
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
    return new Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0), 
      width: 370,
      height: 200,
        child: ButtonTheme(
          child: 
            FlatButton.icon(
            color: Color.fromARGB(255, 124, 77, 255),
            icon: ImageIcon(AssetImage("assets/icons/activities_icon.png"), size: 50, color:Colors.white),
            label: Text(allTranslations.text('tab_activities'), style: TextStyle(color: Colors.white, fontSize: 32)), //`Text` to display
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Actividades(auth: widget.auth,userId: widget.userId ,diaSeleccionado: null, bl: true)),
                );
              },
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          ),
        ),
    );
  }

  Widget _calendar(){
    return new Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0), 
      width: 370,
      height: 200,
      child: ButtonTheme(
          child: 
            FlatButton.icon(
            color: Color.fromARGB(255, 236, 64, 122),
            icon: ImageIcon(AssetImage("assets/icons/calendar_icon.png"), size: 50, color:Colors.white), //`Icon` to display
            label: Text(allTranslations.text('tab_calendar'), style: TextStyle(color: Colors.white, fontSize: 32)), //`Text` to display
            onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Calendario(auth: widget.auth,userId: widget.userId, bl: false,)),
                );
              },
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          ),
        ),
    );
  }

  Widget _tienda(){
    return new Container(
      padding: EdgeInsets.fromLTRB(20, 20, 10, 0), 
      width: 200,
      height:125,
      child: ButtonTheme(
      child: FlatButton.icon(
          color: Color.fromARGB(255, 33, 150, 243),
          icon: ImageIcon(AssetImage("assets/icons/store_icon.png"), size: 50, color:Colors.white), //`Icon` to display
          label: Text(allTranslations.text('tab_store'), style: TextStyle(color: Colors.white)), //`Text` to display
          onPressed: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Tienda()),
                );
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ),
    ));
  }

  Widget _ajustes(){
    return new Container(
      padding: EdgeInsets.fromLTRB(20, 20, 10, 0), 
      width: 200,
      height:125,
      child: ButtonTheme(
      child: FlatButton.icon(
          color: Color.fromARGB(255, 50, 50, 50),
          icon: ImageIcon(AssetImage("assets/icons/settings_icon.png"), size: 50, color:Colors.white), //`Icon` to display
          label: Text(allTranslations.text('tab_settings'), style: TextStyle(color: Colors.white)), //`Text` to display
          onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Settings(auth: widget.auth)),
              );
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ),
    )
    
    );
  }

  Widget _asistente(){
    return new Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 250,
      child: FlatButton.icon(
          color: Color.fromARGB(255, 213, 0, 249),
          icon: ImageIcon(AssetImage("assets/icons/assistant_icon.png"), size: 50, color:Colors.white), //`Icon` to display
          label: Text(allTranslations.text('tab_assistant'), style: TextStyle(color: Colors.white)), //`Text` to display
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
          title: Text(allTranslations.text('app_greeting') + name + "!"),
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

