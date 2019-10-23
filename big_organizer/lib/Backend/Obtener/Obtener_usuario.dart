import 'package:cloud_firestore/cloud_firestore.dart';

class Obtener_usuario {
  Obtener_usuario({this.userId});
  String userId;
  String nombre;
  obtener_datos(){

   DocumentReference documentReference =
                Firestore.instance.collection("Usuario").document(userId);
            documentReference.get().then((datasnapshot) {
              if (datasnapshot.exists) {
                nombre=datasnapshot.data['name'].toString();
              }
              else{
                print("No such user");
              }
            });
  }

  Future<String> valor() async {
    await obtener_datos();
    print(nombre);
    return nombre;
  }
}
