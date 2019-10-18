import 'package:firebase_database/firebase_database.dart';

class Objetivo {
  //Definicion de atributos de la matriz o tabla de la base de datos
  String _id;
  String _name;
  String _description;
  int _score;
  bool _active;

  //Definicion de los metodos encargados de proveer los datos en los atributos de la base de datos
  String get id=>_id;
  String get name=>_name;
  String get description=>_description;
  int get score=>_score;
  bool get active=>_active;

  //Constructor encargado de inicializarme los valores
  Objetivo(this._id,this._name,this._description,this._score,this._active);

  //Mapeo necesario para poder definirlo como una tabla perteneciente a la base de datos
  Objetivo.map(dynamic obj){
    this._name=obj['name'];
    this._description=obj['description'];
    this._score=obj['score'];
    this._active=obj['active'];
  }

  //Asignacion de funcion en la base de datos
  Objetivo.fromSnapShot(DataSnapshot snapshot):
    _id=snapshot.key,
    _name=snapshot.value['name'],
    _description=snapshot.value['description'],
    _score=snapshot.value['score'],
    _active=snapshot.value['active'];

  //Creaccion del json para el Query
  toJson() {
    return {
      "name": _name,
      "description": _description,
      "score": _score,
      "active": _active,
    };
  }

}