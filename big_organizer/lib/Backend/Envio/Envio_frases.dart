import 'package:big_organizer/Backend/Tablas/Frase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Envio_frases {
  Envio_frases({this.frases});
  final Firestore _database = Firestore.instance;
  
  String frases;

  addNewdfrase() {
    Frase frase = new Frase(frases);
    _database.collection("Frases").document("${1}").setData(frase.toJson());  
  }
}
