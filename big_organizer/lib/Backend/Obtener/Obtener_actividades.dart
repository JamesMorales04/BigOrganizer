import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Obtener_actividad {
  Obtener_actividad({this.userId});
  String userId;
  String userId_db;

  obtener_datos(){
   DocumentReference documentReference =
                Firestore.instance.collection("Actividad").document(userId);
            documentReference.get().then((datasnapshot) {
              if (datasnapshot.exists) {
                userId_db=datasnapshot.data['userId'];
                print("esto es lo que hay-------");
                print(userId_db.trimRight());
                print("esto es lo que hay-------");
                return userId_db;
              }
              else{
                print("No such userId");
              }
            });
  }

  Future<String> valor() async {
    await obtener_datos();
    print(userId_db);
    return userId_db;
  }
}
