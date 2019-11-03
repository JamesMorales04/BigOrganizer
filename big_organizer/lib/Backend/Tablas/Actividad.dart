import 'package:flutter/widgets.dart';

class Actividad {
  //Definicion de atributos de la matriz o tabla de la base de datos
  String _userId;
  String _id;
  String _name;
  String _icon;
  String _description;
  String _diaSeleccionado;


  //Definicion de los metodos encargados de proveer los datos en los atributos de la base de datos
  String get userId=>_userId;
  String get id=>_id;
  String get name=>_name;
  String get icon=>_icon;
  String get description=>_description;
  String get diaSeleccionado=>_diaSeleccionado;


  //Constructor encargado de inicializarme los valores
  Actividad(this._userId,this._id,this._name,this._icon,this._description,this._diaSeleccionado);

  //Creaccion del json para el Query
  toJson() {
    return {
      "userId": _userId,
      "id": _id,
      "name": _name,
      "icon": _icon,
      "description": _description,
      "diaSeleccionado": _diaSeleccionado
    };
  }
  

}