import 'package:firebase_database/firebase_database.dart';

class Tarea {
  //Definicion de atributos de la matriz o tabla de la base de datos
  String _id;
  String _description;
  DateTime _fecha_inicio;
  DateTime _fecha_final;
  bool _notificar;

  //Definicion de los metodos encargados de proveer los datos en los atributos de la base de datos
  String get id=>_id;
  String get description=>_description;
  DateTime get fecha_inicio=>_fecha_inicio;
  DateTime get fecha_final=>_fecha_final;
  bool get notificar=>_notificar;

  //Constructor encargado de inicializarme los valores
  Tarea(this._id,this._description,this._fecha_inicio,this._fecha_final,this._notificar);

  //Mapeo necesario para poder definirlo como una tabla perteneciente a la base de datos
  Tarea.map(dynamic obj){
    this._description=obj['description'];
    this._fecha_inicio=obj['fecha_inicio'];
    this._fecha_final=obj['fecha_final'];
    this._notificar=obj['notificar'];
  }

  //Asignacion de funcion en la base de datos
  Tarea.fromSnapShot(DataSnapshot snapshot):
    _id=snapshot.key,
    _description=snapshot.value['description'],
    _fecha_inicio=snapshot.value['fecha_inicio'],
    _fecha_final=snapshot.value['fecha_final'],
    _notificar=snapshot.value['notificar'];
  //Creaccion del json para el Query
  toJson() {
    return {
      "description": _description,
      "fecha_inicio": _fecha_inicio,
      "fecha_final": _fecha_final,
      "notificar": _notificar,
    };
  }

}