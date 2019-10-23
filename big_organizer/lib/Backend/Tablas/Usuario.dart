class Usuario {

  //Definicion de atributos de la matriz o tabla de la base de datos
  String _name;
  String _genre;
  String _pais;
  bool _admin;
  int _age;

  //Definicion de los metodos encargados de proveer los datos en los atributos de la base de datos
  String get name=>_name;
  String get genre=>_genre;
  String get pais=>_pais;
  bool get admin=>_admin;
  int get age=>_age;

  //Constructor encargado de inicializarme los valores
  Usuario(this._name,this._genre,this._pais,this._admin,this._age);

  //Creaccion del json para el Query
  toJson() {
    return {
      "name": _name,
      "genre": _genre,
      "admin": _admin,
      "pais": _pais,
      "age": _age,
    };
  }

}