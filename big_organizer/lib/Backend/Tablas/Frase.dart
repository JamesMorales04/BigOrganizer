class Frase {

  //Definicion de atributos de la matriz o tabla de la base de datos
  String _frase;


  //Definicion de los metodos encargados de proveer los datos en los atributos de la base de datos
  String get frase=>_frase;

  //Constructor encargado de inicializarme los valores
  Frase(this._frase);

  //Creaccion del json para el Query
  toJson() {
    return {
      "español": _frase,

    };
  }

}