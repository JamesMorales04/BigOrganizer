import 'package:big_organizer/Frontend/Menu/Menu.dart';
import 'package:flutter/material.dart';
import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';

class Login extends StatefulWidget {
  Login({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = new GlobalKey<FormState>();

  String _correo;
  String _contrasena;
  String userId;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      children: <Widget>[
        _titulo(),
        _entrys(),
        _restablecer(),
        _iniciar(),
        _volver()
      ],
    ));
  }

  Widget _entrys() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _email(),
              _password(),
            ],
          ),
        ));
  }

  Widget _titulo() {
    return new Container(
      padding: EdgeInsets.only(top: 70),
      child: Text(
        "Login",
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        textScaleFactor: 5,
      ),
    );
  }

  Widget _email() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
      child: new TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(hintText: 'Correo Electronico'),
        validator: (value) => value.isEmpty ? 'Ingresa un correo valido' : null,
        onSaved: (value) => _correo = value.trim(),
      ),
    );
  }

  Widget _password() {
    return new Padding(
        padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
        child: new TextFormField(
          autofocus: false,
          obscureText: true,
          decoration: InputDecoration(hintText: "Contraseña"),
          validator: (value) =>
              value.isEmpty ? 'La contraseña no puede ser vacia' : null,
          onSaved: (value) => _contrasena = value.trim(),
        ));
  }

  Widget _restablecer() {
    return new Container(
        padding: EdgeInsets.only(top: 10),
        child: FlatButton(
          child: Text(
            "¿ Olvidaste tu contraseña ?",
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: () {},
        ));
  }

  Widget _iniciar() {
    return new Container(
        padding: EdgeInsets.only(top: 70),
        child: RaisedButton(
          child: Text(
            "Iniciar Sesion",
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(255, 63, 169, 245),
          onPressed: _iniciar_sesion,
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ));
  }

  Widget _volver() {
    return new Container(
        padding: EdgeInsets.only(top: 20),
        child: RaisedButton(
          child: Text(
            "Volver",
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(255, 63, 169, 245),
          onPressed: () {
              Navigator.pop(context);
            },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ));
  }

  bool _validar() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _iniciar_sesion() async {
    if (_validar()) {
      print(_correo);
      print(_contrasena);
      try {
        String _id = await widget.auth.signIn(_correo, _contrasena);
        userId =_id;
        print('Signed in: $_id');
        _valido();
      } catch (e) {
        _error(context);
        print('jelouda');
      }
    }
  }

  void _valido() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Menu(auth: widget.auth, userId: userId,)),
    );
  }

  Widget _error(BuildContext context) {
    showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text("El correo o la contraseña no son validos"),
            actions: <Widget>[
              FlatButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }
}
