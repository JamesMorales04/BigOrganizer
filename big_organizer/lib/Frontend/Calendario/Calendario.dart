import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  CalendarController _calendarController = new CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendario"),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              _calendarController.dispose();
              Navigator.of(context).pop();
            },
          )
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
}


