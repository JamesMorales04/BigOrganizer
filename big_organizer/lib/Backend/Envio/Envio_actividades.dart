import 'package:big_organizer/Backend/Tablas/Actividad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Envio_actividades {
  Envio_actividades({this.userId,this.id,this.name,this.icon,this.description,this.diaSeleccionado});
  final Firestore _database = Firestore.instance;
  
  String userId;
  String id;
  String name;
  String icon;
  String description;
  String diaSeleccionado;

  addNewactividad() {
    Actividad actividad = new Actividad(userId,id,name,icon,description,diaSeleccionado);
    _database.collection("Actividad").document(userId).collection("ActividadesUsuario").document().setData(actividad.toJson());
  }
}
