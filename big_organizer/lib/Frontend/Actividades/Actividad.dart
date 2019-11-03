import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Actividad {
  
  Actividad(this._userId,this._id,this._name,this._icon,this._description,this._diaSeleccionado);

  String _userId;
  String _id;
  String _name;
  String _icon;
  String _description;
  String _diaSeleccionado;
  
  Widget actividadView() {
    return Container(
          padding: new EdgeInsets.all(32.0),
          height: 360,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Color.fromRGBO(83, 197, 248, 1),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    Image.asset("assets/icons/test_icon.png"),
                    Text('Actividad 1'),
                    IconButton(
                      icon:Icon(Icons.access_alarm),
                      tooltip: "Mensaje",
                    )
                  ],
              ),
            ),
          ),
    );
  }
  Widget contenidoActividad() {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_name'),
      ),
      body: Container(
          height: 50,
          color: Colors.blueGrey[50],
          child: ListView(
            children: <Widget>[
            Center(
              child: Text('$_icon')
            ),
            Center(
              child: Text('$_name'),
            ),
            Container(
              child: Text('$_description')
            ),
            Container(
              child: Text('$_diaSeleccionado')
            )
            ]
        )
      )
    );
  }
}

