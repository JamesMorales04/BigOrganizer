import 'package:firebase_database/firebase_database.dart';

class Actividad {
  //Definicion de atributos de la matriz o tabla de la base de datos
  String _id;
  String _name;
  String _icon;


  //Definicion de los metodos encargados de proveer los datos en los atributos de la base de datos
  String get id=>_id;
  String get name=>_name;
  String get icon=>_icon;


  //Constructor encargado de inicializarme los valores
  Actividad(this._id,this._name,this._icon);

  //Mapeo necesario para poder definirlo como una tabla perteneciente a la base de datos
  Actividad.map(dynamic obj){
    this._name=obj['name'];
    this._icon=obj['email'];

  }

  //Asignacion de funcion en la base de datos
  Actividad.fromSnapShot(DataSnapshot snapshot):
    _id=snapshot.key,
    _name=snapshot.value['name'],
    _icon=snapshot.value['icon'];
  //Creaccion del json para el Query
  toJson() {
    return {
      "name": _name,
      "icon": _icon,
    };
  }
  

}