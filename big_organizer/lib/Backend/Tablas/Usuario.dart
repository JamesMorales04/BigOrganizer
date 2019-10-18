import 'package:firebase_database/firebase_database.dart';

class Usuario {

  //Definicion de atributos de la matriz o tabla de la base de datos
  String _id;
  String _name;
  String _email;
  String _genre;
  bool _admin;
  int _age;

  //Definicion de los metodos encargados de proveer los datos en los atributos de la base de datos
  String get id=>_id;
  String get name=>_name;
  String get genre=>_genre;
  bool get admin=>_admin;
  int get age=>_age;

  //Constructor encargado de inicializarme los valores
  Usuario(this._id,this._name,this._email,this._genre,this._admin,this._age);

  Usuario.map(dynamic obj){
    this._name=obj['name'];
    this._email=obj['email'];
    this._genre=obj['genre'];
    this._admin=obj['admin'];
    this._age=obj['age'];
  }

  //Asignacion de funcion en la base de datos
  Usuario.fromSnapShot(DataSnapshot snapshot):
    _id=snapshot.key,
    _name=snapshot.value['name'],
    _email=snapshot.value['email'],
    _genre=snapshot.value['genre'],
    _admin=snapshot.value['admin'],
    _age=snapshot.value['age'];
  
  //Creaccion del json para el Query
  toJson() {
    return {
      "name": _name,
      "email": _email,
      "genre": _genre,
      "admin": _email,
      "age": _age,
    };
  }

}