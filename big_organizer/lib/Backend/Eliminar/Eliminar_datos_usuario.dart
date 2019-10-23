import 'package:cloud_firestore/cloud_firestore.dart';

class Eliminar_datos_usuario {

  Eliminar_datos_usuario({this.userId});
  String userId;

  borrar_datos() {

    Firestore.instance.collection("Usuario").document(userId).delete().catchError((e){
      print(e);
    });
  }
}
