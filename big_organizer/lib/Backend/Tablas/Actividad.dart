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

  //Creaccion del json para el Query
  toJson() {
    return {
      "name": _name,
      "icon": _icon,
    };
  }
  

}