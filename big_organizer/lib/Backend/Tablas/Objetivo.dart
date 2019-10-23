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