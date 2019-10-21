import 'package:firebase_database/firebase_database.dart';

class Usuario {

  //Definicion de atributos de la matriz o tabla de la base de datos
  String _key;
  String _userId;
  String _name;
  String _genre;
  bool _admin;
  int _age;

  //Definicion de los metodos encargados de proveer los datos en los atributos de la base de datos
  String get key=>_key;
  String get userId=>_userId;
  String get name=>_name;
  String get genre=>_genre;
  bool get admin=>_admin;
  int get age=>_age;

  //Constructor encargado de inicializarme los valores
  Usuario(this._userId, this._name,this._genre,this._admin,this._age);

  //Asignacion de funcion en la base de datos
  Usuario.fromSnapShot(DataSnapshot snapshot):
    _key=snapshot.key,
    _userId=snapshot.value['userId'],
    _name=snapshot.value['name'],
    _genre=snapshot.value['genre'],
    _admin=snapshot.value['admin'],
    _age=snapshot.value['age'];
  
  //Creaccion del json para el Query
  toJson() {
    return {
      "userId":_userId,
      "name": _name,
      "genre": _genre,
      "admin": _admin,
      "age": _age,
    };
  }

}