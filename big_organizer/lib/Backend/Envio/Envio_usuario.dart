import 'package:big_organizer/Backend/Tablas/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Envio_usuario {
  Envio_usuario({this.userId,this.nombre,this.genero,this.pais});
  final Firestore _database = Firestore.instance;
  
  String userId;
  String nombre;
  String genero;
  String pais;

  addNewTodo() {
    Usuario user = new Usuario(nombre,genero,pais,false,0);
    _database.collection("Usuario").document(userId).setData(user.toJson());
  
  }
}
