import 'package:flutter/material.dart';
import 'package:big_organizer/Backend/Autenticacion/Creacion/BaseAuth.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  Widget _logo() {
    return new Container(
      padding: EdgeInsets.only(top: 40),
      child: Image.asset(
        'assets/icons/app_icon.png',
        height: 200,
      ),
    );
  }
}