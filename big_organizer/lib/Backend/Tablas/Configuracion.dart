import 'package:firebase_database/firebase_database.dart';

class Configuracion {
  //Definicion de atributos de la matriz o tabla de la base de datos
  bool _modo_oscuro;
  String _idioma;
  int _frecuencia_objetivos;


  //Definicion de los metodos encargados de proveer los datos en los atributos de la base de datos
  bool get modo_oscuro=>_modo_oscuro;
  String get idioma=>_idioma;
  int get frecuencia_objetivos=>_frecuencia_objetivos;


  //Constructor encargado de inicializarme los valores
  Configuracion(this._modo_oscuro,this._idioma,this._frecuencia_objetivos);

  //Mapeo necesario para poder definirlo como una tabla perteneciente a la base de datos
  Configuracion.map(dynamic obj){
    this._modo_oscuro=obj['modo_oscuro'];
    this._idioma=obj['idioma'];
    this._frecuencia_objetivos=obj['frecuencia_objetivos'];

  }

  //Asignacion de funcion en la base de datos
  Configuracion.fromSnapShot(DataSnapshot snapshot):
    _modo_oscuro=snapshot.value['modo_oscuro'],
    _idioma=snapshot.value['idioma'],
    _frecuencia_objetivos=snapshot.value['frecuencia_objetivos'];

  //Creaccion del json para el Query
  toJson() {
    return {
      "modo_oscuro": _modo_oscuro,
      "idioma": _idioma,
      "frecuencia_objetivos": _frecuencia_objetivos
    };
  }

}