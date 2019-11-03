import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:big_organizer/Backend/Envio/Envio_actividades.dart';
import 'package:big_organizer/Backend/Obtener/Obtener_actividades.dart';
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';
import 'package:flutter/material.dart';

class Actividades extends StatefulWidget {
  @override
  _ActividadesState createState() => _ActividadesState();
  Actividades({this.auth,this.userId,this.diaSeleccionado});
  final BaseAuth auth;
  final userId;
  final diaSeleccionado;
}

class _ActividadesState extends State<Actividades> {
  var ArrActividades =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(allTranslations.text('tab_activities')),
        ),
        body:Center(
          child:Container(
            child:_list_actividades()
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AgregarActividad(auth: widget.auth,userId: widget.userId ,diaSeleccionado: widget.createElement())));
          },
          child: Icon(Icons.add)
        ),
      
    );
  }

  Widget _list_actividades() {
    return ListView(
      children: <Widget>[
        //lista con las actividades a mostrar
        //Container()
      ]
    );
  }

  consultarActividadesBd() {
    var datosActividades = new Obtener_actividad();
    print(datosActividades.valor());
  }

}




class AgregarActividad extends StatefulWidget{
  @override
  _AgregarActividadState createState() => _AgregarActividadState();
  AgregarActividad({this.auth,this.userId,this.diaSeleccionado});
  final BaseAuth auth;
  final userId;
  final diaSeleccionado;
}

class _AgregarActividadState extends State<AgregarActividad>{
  String test = '';
  String _userId;
  String _id;
  String _name;
  String _icon;
  String _description;
  String _diaSeleccionado;
  final textControlerName = TextEditingController();
  final textControlerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: aceptarButton(),
      appBar: AppBar(
        title: Text('Agregar actividad'),
      ),
      body: Column(
        children: <Widget>[
            _entrys(),
            Text(
              test       
            ),
            datosbd()
          ]
      ),
    );
  }

  Widget datosbd() {
    var data;
    data = new Obtener_actividad(userId: widget.userId);
    print("esto es lo que hay");
    print(data.obtener_datos);
    print("esto es lo que hay");
    return Text('---------');
  }

  enviaActividadBd(_userId,_id,_name,_icon,_description,diaSeleccionado) {
    Envio_actividades envio = new Envio_actividades(userId: _userId, id: _id, name: _name, icon: _icon, description: _description, diaSeleccionado: diaSeleccionado);
    envio.addNewactividad();
  }

  Widget _entrys() {
  return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            name(),
            descripcion(),
          ],
        ),
      )
      
    );
  }

  Widget name() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: new TextField(
        controller: textControlerName,
        keyboardType: TextInputType.text,
        autofocus: true,
        decoration: new InputDecoration(
          labelText: 'Nombre de la actividad',
          hintText: 'Nombre de la actividad',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
          )
        ),
      ),
    );
  }
  Widget descripcion() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: new TextField(
        controller: textControlerDescription,
        maxLines: 4,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          labelText: 'Descripcion',
          hintText: 'Descripcion',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
        ),

      )
    );
  }

  Widget aceptarButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
        child: new RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Agregar actividad'),
          onPressed: () {
            setState(() {
              _name = textControlerName.text;
              _description = textControlerDescription.text; 
              _userId=widget.userId; 
              //_diaSeleccionado = widget.diaSeleccionado;
              _icon="hola soy un icono";
              

              test = _name + _description;

            });
            enviaActividadBd(_userId, _id, _name, _icon, _description,_diaSeleccionado);
          },
        )
      ),
    );
  }
}
