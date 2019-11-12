import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Obtener_actividad {
  Obtener_actividad({this.userId});
  String userId;
  String datosActividades; 
/*
  obtener_datos(){

   DocumentReference documentReference =
                Firestore.instance.collection("Actividad").document(userId).collection("ActividadesUsuario").document("LevH2WOiXBeGaTPGFYwK");

            documentReference.get().then((datasnapshot) {
              if (datasnapshot.exists) {
                datosActividades=datasnapshot.data['name'].toString();
                print("esto es lo que hay-------");
                print("metodo al que quiero llegar");
                print("esto es lo que hay-------");
              }
              else{
                print("No such userId");
              }
            }
          );
  }*/

  obtener_datos() async {
    
  }

  Future<String> valor() async {
    await obtener_datos();
    print("holaaaa");
    return "holaaaaaaaaaaaa";
  }
}
