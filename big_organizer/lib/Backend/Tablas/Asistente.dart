import 'package:firebase_database/firebase_database.dart';

class Asistente {
  //Definicion de atributos de la matriz o tabla de la base de datos
  String _name;
  String _skin;
  int _age;
  String _estado;
  String _genre;

  //Definicion de los metodos encargados de proveer los datos en los atributos de la base de datos
  String get name=>_name;
  String get skin=>_skin;
  int get age=>_age;
  String get estado=>_estado;
  String get genre=>_genre;

  //Constructor encargado de inicializarme los valores
  Asistente(this._name,this._skin,this._age,this._estado,this._genre);

  //Mapeo necesario para poder definirlo como una tabla perteneciente a la base de datos
  Asistente.map(dynamic obj){
    this._name=obj['name'];
    this._skin=obj['skin'];
    this._age=obj['age'];
    this._estado=obj['estado'];
    this._genre=obj['genre'];

  }

  //Asignacion de funcion en la base de datos
  Asistente.fromSnapShot(DataSnapshot snapshot):
    _name=snapshot.value['name'],
    _skin=snapshot.value['skin'],
    _age=snapshot.value['age'],
    _estado=snapshot.value['estado'],
    _genre=snapshot.value['genre'];
  //Creaccion del json para el Query
  toJson() {
    return {
      "name": _name,
      "skin": _skin,
      "age": _age,
      "estado": _estado,
      "genre": _genre
    };
  }

}