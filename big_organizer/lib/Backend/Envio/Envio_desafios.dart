import 'package:big_organizer/Backend/Tablas/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Envio_desafios {
  Envio_desafios({this.userId,this.nombre,this.genero,this.pais,this.fecha_nacimiento});
  final Firestore _database = Firestore.instance;
  
  String userId;
  String nombre;
  String genero;
  String pais;
  DateTime fecha_nacimiento;

  addNewdesafio() {
    Usuario user = new Usuario(nombre,genero,pais,false,fecha_nacimiento);
    _database.collection("Usuario").document(userId).setData(user.toJson());
  
  }
}
