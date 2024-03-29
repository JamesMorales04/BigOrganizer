import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:big_organizer/Backend/Eliminar/Eliminar_datos_usuario.dart';
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
  Settings({this.auth});
  final BaseAuth auth;
}

class _SettingsState extends State<Settings> {

  Widget _listaidiomas(){
    String valor = allTranslations.text('button_language');
    return new Container(
      padding: EdgeInsets.only(top: 10),
      child: new DropdownButton<String>(
            hint: Text(valor),
            items: <String>['English', 'Español', 'Português'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              valor = value;
              allTranslations.setNewLanguage(value);
              setState((){});
              Navigator.of(context).pop();   
            },
          ),
    );
  }

  void _seleccionaridioma() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(allTranslations.text('message_select_language')),
          actions: <Widget>[
            _listaidiomas(),
            new FlatButton(
              child: new Text(allTranslations.text('button_cancel')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmarborrado() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(allTranslations.text('message_are_you_sure')),
          content: new Text(allTranslations.text('popup_cannot_be_undone')),
          actions: <Widget>[
            new FlatButton(
              child: new Text(allTranslations.text('button_cancel')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text(allTranslations.text('button_accept')),
              onPressed: () async {
                Eliminar_datos_usuario eliminar_datos_usuario = new Eliminar_datos_usuario(userId: await widget.auth.getCurrentUserid());
                eliminar_datos_usuario.borrar_datos();
                widget.auth.delete_account();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            )
          ],
        );
      },
    );
  }

  Widget _cambiaridioma() {
    return new ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
      onPressed: () {
        _seleccionaridioma();
      },
      child: Text(allTranslations.text('button_language'), style: TextStyle(color: Colors.white)),
      color: Color.fromARGB(255, 63, 169, 245),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
      ),
    );
  }

  Widget _borrarcuenta(){

    return new ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
      onPressed: _confirmarborrado,
      child: Text(allTranslations.text('button_delete_account'), style: TextStyle(color: Colors.white)),
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
      child: Text(allTranslations.text('button_logout'), style: TextStyle(color: Colors.white)),
      color: Color.fromARGB(255, 63, 169, 245),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(allTranslations.text('tab_settings')),
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