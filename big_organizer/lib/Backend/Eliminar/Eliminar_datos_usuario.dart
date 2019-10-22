import 'package:firebase_database/firebase_database.dart';

class Eliminar_datos_usuario {

  Eliminar_datos_usuario({this.userId});
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  String userId;
  Query _userQuery;

  borrar_datos() {
    _userQuery = _database.reference().child("Usuario").equalTo(userId);
    _database.reference().child("Usuario").child(userId).remove();  
  }
}
