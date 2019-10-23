import 'package:big_organizer/Backend/Envio/Envio_usuario.dart';
import 'package:big_organizer/Frontend/Menu/Menu.dart';
import 'package:flutter/material.dart';
import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
  String _fecha = "Ingresa una fecha de nacimiento";
  DateTime _fecha_de_nacimiento;
  String _genero;
  Country _pais;
  String _confirmar;
  List<String> _generos = ['Masculino', 'Femenino', 'Helicopter'];
  String _errores = "";
  String _userId;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      children: <Widget>[
        _titulo(),
        _entrys(),
        _country(),
        _genere(),
        _age(),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _registrar(),
              _volver(),
            ],
          ),
        )
      ],
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
        validator: (value) => value.isEmpty ? 'Ingresa un nombre' : null,
        onSaved: (value) => _nombre = value.trim(),
      ),
    );
  }

  Widget _age() {
    return new Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: new RaisedButton(
          onPressed: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(1900, 1, 1),
                maxTime: DateTime.now(), onChanged: (date) {
              setState(() {
                _fecha = date.toString().split(" ")[0];
                _fecha_de_nacimiento = date;
              });
            }, onConfirm: (date) {
              setState(() {
                _fecha = date.toString().split(" ")[0];
                _fecha_de_nacimiento = date;
              });
            }, currentTime: DateTime.now(), locale: LocaleType.es);
          },
          child: Text(
            _fecha,
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(255, 63, 169, 245),
        ));
  }

  Widget _email() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: new TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(hintText: 'Correo Electronico'),
        validator:(value) {
          if(value.isEmpty){
            return "El correo no pude estar vacio";
          }
          return null;
        },
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
        validator:(value) {
          if(value.isEmpty){
            return "La contraseña no puede estar vacio";
          }
          if(value.length<6){
            return "La contraseña debe tener almenos 6 caracteres";
          }
          return null;
        },
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
            return "Debe tener 6 caracteres";
          }
          return null;
        },
        onSaved: (value) => _confirmar = value.trim(),
      ),
    );
  }

  Widget _genere() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(35, 20, 35, 0),
        child: new DropdownButton<String>(
          isExpanded: true,
          hint: Text("Genero"),
          value: _genero,
          items: _generos.map((String valor) {
            return new DropdownMenuItem<String>(
              value: valor,
              child: new Text(valor),
            );
          }).toList(),
          onChanged: (String dato) {
            setState(() {
              _genero = dato;
            });
          },
        ));
  }

  Widget _country() {
    return Padding(
        padding: EdgeInsets.fromLTRB(35, 20, 35, 0),
        child: CountryPicker(
          dense: false,
          showFlag: true,
          showDialingCode: false,
          showName: true,
          onChanged: (Country country) {
            setState(() {
              _pais = country;
            });
          },
          selectedCountry: _pais,
        ));
  }

  Widget _registrar() {
    return new Container(
        padding: EdgeInsets.only(top: 30),
        child: RaisedButton(
            child: Text(
              "Registrar",
              style: TextStyle(color: Colors.white),
            ),
            color: Color.fromARGB(255, 63, 169, 245),
            onPressed: _iniciar_sesion,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))));
  }

  Widget _volver() {
    return new Container(
        padding: EdgeInsets.only(top: 30),
        child: RaisedButton(
            child: Text(
              "Volver",
              style: TextStyle(color: Colors.white),
            ),
            color: Color.fromARGB(255, 63, 169, 245),
            onPressed: () {
              Navigator.pop(context);
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))));
  }

  bool _validar() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      if(_contrasena!=_confirmar){
        _errores = "Ambas contraseñas no coinciden";
        _error(context);
        return false;
      }
      if (_genero == null) {
        _errores = "Por favor ingresa un genero";
        _error(context);
        return false;
      }
      if (_fecha_de_nacimiento == null) {
        _errores = "Por favor ingresa una fecha de nacimiento";
        _error(context);
        return false;
      }
      if (_pais == null) {
        _errores = "Por favor ingresa un pais";
        _error(context);
        return false;
      }
      return true;
    }
    return false;
  }

  void _iniciar_sesion() async {
    if (_validar()) {
      print(_correo);
      print(_contrasena);
      print(_confirmar);
      try {
        String _id = await widget.auth.signUp(_correo, _contrasena);
        _userId=_id;
        print(_genero);
        print(_pais);
        Envio_usuario envio = new Envio_usuario(
            userId: _id, nombre: _nombre, genero: _genero, pais: _pais.name, fecha_nacimiento: _fecha_de_nacimiento);
        envio.addNewTodo();
        print('Signed in: $_id');
        _valido();
      } catch (e) {
        _errores="Esta cuenta ya esta en uso";
        _error(context);
        print('jelouda');
      }
    }
  }

  void _valido() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Menu(auth: widget.auth,userId: _userId,)),
    );
  }

  Widget _error(BuildContext context) {
    showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Text(_errores),
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
