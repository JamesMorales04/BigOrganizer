import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';
import 'package:flutter/material.dart';
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:big_organizer/Frontend/Actividades/Actividades.dart';


class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
  Calendario({this.auth,this.userId, this.bl});
  final BaseAuth auth;
  final userId;
  final bl;
}

class _CalendarioState extends State<Calendario> {
  CalendarController _calendarController = new CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(allTranslations.text('tab_calendar')),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              _buildTableCalendar(),

              Divider(
                height: 50,
                color: Colors.grey,
              ),

              
            ],
          ),
        ),
    );
  }
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      onDaySelected: (diaSeleccionado, list_eventosDiaSeleccionado) {
        _diaSeleccionado(diaSeleccionado.day, list_eventosDiaSeleccionado);
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
  void _diaSeleccionado(diaSeleccionado, list_eventosDiaSeleccionado) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Actividades(auth: widget.auth,userId: widget.userId ,diaSeleccionado: diaSeleccionado, bl: false)),
    );
  }
}


