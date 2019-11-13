import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:big_organizer/Backend/Envio/Envio_actividades.dart';
import 'package:big_organizer/Frontend/Actividades/Actividad.dart';
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Actividades extends StatefulWidget {
  @override
  _ActividadesState createState() => _ActividadesState();
  Actividades({this.auth, this.userId, this.diaSeleccionado, this.bl});
  final BaseAuth auth;
  final userId;
  final diaSeleccionado;
  final bl;
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
            return Text(allTranslations.text('message_loading'));
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
    return values.isEmpty ? Center(child: Text(allTranslations.text("activity_empty"))) : ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new ListTile(
                      title: new Text(values[index].name),
                      subtitle: new Text(
                          '${allTranslations.text("activity_description")}: ${values[index].description} \n${allTranslations.text("activity_day")}:${values[index].diaSeleccionado}'),
                      leading: new Icon(Icons.calendar_today),
                      onTap: () {
                        //
                      },
                    ),
                    Stack(children: <Widget>[
                      Align(
                        alignment: Alignment(0.9, 0.0),
                        child: FlatButton(
                          onPressed: () {
                            deleteActividad(values[index].id);
                            setState((){});
                          },
                          child: Text(allTranslations.text("activity_delete")),
                          color: Colors.blue[400],
                        ),
                      )
                    ])
                  ],
                ),
              ),
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
      if (!arrActividades.contains(auxActividad)) {
        if (widget.diaSeleccionado.toString() == act['diaSeleccionado'] && widget.bl==false) {
          arrActividades.add(auxActividad);
        } else if(widget.bl==true){
          arrActividades.add(auxActividad);
        }
        
      }
    }
    print(arrActividades);
    return arrActividades;
  }

  void deleteActividad(idAct) async {
    await db
        .collection("Actividad")
        .document(widget.userId)
        .collection('ActividadesUsuario')
        .document(idAct)
        .delete();
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
        title: Text(allTranslations.text("activity_add")),
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
            labelText: allTranslations.text("activity_name"),
            hintText: allTranslations.text("activity_name"),
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
            labelText: allTranslations.text("activity_description"),
            hintText: allTranslations.text("activity_description"),
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
        child: Text(allTranslations.text("activity_add")),
        onPressed: () {
          setState(() {
            _name = textControlerName.text;
            _description = textControlerDescription.text;
            _userId = widget.userId;
            _diaSeleccionado = widget.diaSeleccionado.toString();
            if(widget.diaSeleccionado==null){
              _diaSeleccionado = allTranslations.text("activity_day_not_selected");
            }
            _icon = "Internal icon test";
            test = allTranslations.text("message_sent");
          });
          enviaActividadBd(
            _userId, _id, _name, _icon, _description, _diaSeleccionado
          );
          Navigator.of(context).pop();
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

/*  */
