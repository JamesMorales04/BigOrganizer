import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:big_organizer/Backend/Envio/Envio_actividades.dart';
import 'package:big_organizer/Backend/Obtener/Obtener_actividades.dart';
import 'package:big_organizer/Frontend/Actividades/Actividad.dart';
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Actividades extends StatefulWidget {
  @override
  _ActividadesState createState() => _ActividadesState();
  Actividades({this.auth, this.userId, this.diaSeleccionado});
  final BaseAuth auth;
  final userId;
  final diaSeleccionado;
}

class _ActividadesState extends State<Actividades> {
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    var futurebuilder = new FutureBuilder(
      future: _consultarActividadesBd(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Text('loading');
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return createListView(context, snapshot);
            }
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(allTranslations.text('tab_activities')),
      ),
      body: futurebuilder,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AgregarActividad(
                        auth: widget.auth,
                        userId: widget.userId,
                        diaSeleccionado: widget.diaSeleccionado)));
          },
          child: Icon(Icons.add)),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Actividad> values = snapshot.data;
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        if (values.length == null) {
          print('agrega actividades');
        }
        return Column(
          children: <Widget>[
            new ListTile(
              title: new Text(values[index].name),
              subtitle: new Text(
                  '${values[index].description} ${values[index].diaSeleccionado}'),
              leading: new Icon(Icons.calendar_today),
              onTap: () {
                //implementar vista completa de los datos de la actividad
              },
            ),
            Divider(
              height: 2.0,
            )
          ],
        );
      },
    );
  }

  Future<List<Actividad>> _consultarActividadesBd() async {
    var arrActividades = new List<Actividad>();
    var snapshot = await db
        .collection("Actividad")
        .document(widget.userId)
        .collection("ActividadesUsuario")
        .getDocuments();
    for (var act in snapshot.documents) {
      String id = act.documentID;
      String diaSeleccionado = act['diaSeleccionado'];
      Actividad auxActividad = new Actividad(
          userId: widget.userId,
          id: id,
          name: act['name'],
          icon: act['icon'],
          description: act['description'],
          diaSeleccionado: diaSeleccionado);
      if (!arrActividades.contains(auxActividad) &&
          widget.diaSeleccionado.toString() == act['diaSeleccionado']) {
        arrActividades.add(auxActividad);
      }
    }
    print(arrActividades);
    return arrActividades;
  }
}

class AgregarActividad extends StatefulWidget {
  @override
  _AgregarActividadState createState() => _AgregarActividadState();
  AgregarActividad({this.auth, this.userId, this.diaSeleccionado});
  final BaseAuth auth;
  final userId;
  final diaSeleccionado;
}

class _AgregarActividadState extends State<AgregarActividad> {
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
      body:
          Column(children: <Widget>[_entrys(), Text(test), Text('---------')]),
    );
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
        ));
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
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
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
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ));
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
            _userId = widget.userId;
            _diaSeleccionado = widget.diaSeleccionado.toString();
            _icon = "hola soy un icono";
            test = _name + _description + _diaSeleccionado;
            print('dia sel: ${widget.diaSeleccionado.toString()}');
          });
          enviaActividadBd(
              _userId, _id, _name, _icon, _description, _diaSeleccionado);
        },
      )),
    );
  }

  enviaActividadBd(_userId, _id, _name, _icon, _description, _diaSeleccionado) {
    Envio_actividades envio = new Envio_actividades(
        userId: _userId,
        id: _id,
        name: _name,
        icon: _icon,
        description: _description,
        diaSeleccionado: _diaSeleccionado);
    envio.addNewactividad();
  }
}
