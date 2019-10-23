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