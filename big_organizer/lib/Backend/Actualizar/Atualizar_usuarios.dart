import 'package:cloud_firestore/cloud_firestore.dart';

class Actualizar_usuarios {

  Actualizar_usuarios({this.userId});
  String userId;

  actualizar_datos() {

    Firestore.instance.collection("Usuario").document(userId).updateData({});
  }
}
