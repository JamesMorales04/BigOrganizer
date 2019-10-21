import 'package:big_organizer/Backend/Envio/Envio_usuario.dart';
import 'package:flutter/material.dart';
import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';

class Register extends StatefulWidget {
  Register({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = new GlobalKey<FormState>();

  String _nombre;
  String _correo;
  String _contrasena;
  DateTime _fecha_de_nacimiento;
  String _genero;
  String _pais;
  String _confirmar;

  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      children: <Widget>[_titulo(), _entrys(),Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _registrar(),
            _volver(),
          ],
        ),
      )],
    ));
  }

  Widget _titulo() {
    return new Container(
      padding: EdgeInsets.only(top: 70),
      child: Text(
        "Register",
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        textScaleFactor: 3,
      ),
    );
  }

  Widget _entrys() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _name(),
              _email(),
              _password(),
              _password_conf(),
              _genere(),
              _country()
            ],
          ),
        ));
  }

  Widget _name() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: new TextFormField(
        autofocus: false,
        decoration: new InputDecoration(hintText: 'Nombre completo'),
        validator: (value) => value.isEmpty ? 'Ingresa un nombre valido' : null,
        onSaved: (value) => _nombre = value.trim(),
      ),
    );
  }

  Widget _email() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: new TextFormField(
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(hintText: 'Contraseña'),
        validator: (value) =>
            value.isEmpty ? 'Ingresa una contraseña valida' : null,
        onSaved: (value) => _contrasena = value.trim(),
      ),
    );
  }

  Widget _password_conf() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: new TextFormField(
          autofocus: false,
          obscureText: true,
          decoration: new InputDecoration(hintText: 'Confirmar Contraseña'),
          validator: (value) {

            if (value.isEmpty) {
              return "Ingresa la misma contraseña ";
            }else{
              return null;
            }
            
          },
          onSaved: (value) => _confirmar = value.trim(),
          ),
    );
  }

  Widget _genere() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: new TextFormField(
        autofocus: false,
        decoration: new InputDecoration(hintText: 'Genero'),
        validator: (value) => value.isEmpty ? 'Ingresa un genero' : null,
        onSaved: (value) => _genero = value.trim(),
      ),
    );
  }

  Widget _country() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: new TextFormField(
        autofocus: false,
        decoration: new InputDecoration(hintText: 'Pais'),
        validator: (value) => value.isEmpty ? 'Ingresa un pais' : null,
        onSaved: (value) => _pais= value.trim(),
      ),
    );
  }

  Widget _registrar() {
    return new Container(
        padding: EdgeInsets.only(top: 30),
        child: RaisedButton(
          child: Text(
            "Registrar",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: _iniciar_sesion,
        ));
  }

  Widget _volver() {
    return new Container(
        padding: EdgeInsets.only(top: 30),
        child: RaisedButton(
          child: Text(
            "Volver",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: () {
              Navigator.pop(context);
            },
        ));
  }

  bool _validar() {
    final form = _formKey.currentState;
    if (form.validate() && _confirmar==_contrasena) {
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
        String  _id = await widget.auth.signUp(_correo, _contrasena);
        Envio_usuario envio = new Envio_usuario(userId:_id,nombre: _nombre,genero: _genero,pais: _pais);
        envio.addNewTodo();
        print('Signed in: $_id');
        _valido(context);
      } catch (e) {
        _error(context);
        print('jelouda');
      }
    }
  }

  Widget _valido(BuildContext context) {
    showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text("Bienvenido, es valido prrrrrro"),
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

