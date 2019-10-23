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

  //Creaccion del json para el Query
  toJson() {
    return {
      "modo_oscuro": _modo_oscuro,
      "idioma": _idioma,
      "frecuencia_objetivos": _frecuencia_objetivos
    };
  }

}