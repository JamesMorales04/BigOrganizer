import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:big_organizer/Backend/Eliminar/Eliminar_datos_usuario.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
  Settings({this.auth});
  final BaseAuth auth;
}

class _SettingsState extends State<Settings> {

  Widget _cambiaridioma(){
    return new ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
      onPressed: null,
      child: Text('Cambiar idioma', style: TextStyle(color: Colors.white)),
      color: Color.fromARGB(255, 63, 169, 245),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
      ),
    );
  }

  Widget _borrarcuenta(){

    return new ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
      onPressed: () async {
        Eliminar_datos_usuario eliminar_datos_usuario = new Eliminar_datos_usuario(userId: await widget.auth.getCurrentUserid());
        eliminar_datos_usuario.borrar_datos();
        widget.auth.delete_account();
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
      child: Text('Borrar cuenta', style: TextStyle(color: Colors.white)),
      color: Color.fromARGB(255, 63, 169, 245),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
      ),
    );
  }

  Widget _cerrarsesion(){
    return new ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
      onPressed: () {
        widget.auth.signOut();
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
      child: Text('Cerrar sesion', style: TextStyle(color: Colors.white)),
      color: Color.fromARGB(255, 63, 169, 245),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
      ),
      body: Center(
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _cambiaridioma(),
              _borrarcuenta(),
              _cerrarsesion()
            ]
        ),
      ),
    );
  }
}