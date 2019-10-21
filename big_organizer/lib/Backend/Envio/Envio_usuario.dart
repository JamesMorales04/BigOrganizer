import 'package:big_organizer/Backend/Tablas/Usuario.dart';
import 'package:firebase_database/firebase_database.dart';

class Envio_usuario {
  Envio_usuario({this.userId,this.nombre,this.genero,this.pais});
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  
  String userId;
  String nombre;
  String genero;
  String pais;
  Query _userQuery;

  @override
  void initState() {
    
    _userQuery = _database.reference().child("Usuario").orderByChild("userId").equalTo(userId);

  }

  addNewTodo() {
    Usuario user = new Usuario(userId,nombre,genero,false,0);
    _database.reference().child("Usuario").push().set(user.toJson());
  
  }
}
