import 'package:big_organizer/Frontend/Calendario/Calendario.dart';
import 'package:big_organizer/Frontend/Login/Inicio.dart';
import 'package:big_organizer/Frontend/Login/Login.dart';
import 'package:big_organizer/Frontend/Login/Register.dart';
import 'package:flutter/material.dart';
import 'package:big_organizer/Backend/Autenticacion/Creacion/Auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:big_organizer/Frontend/Lenguaje/Traduccion.dart';

void main() async{
  await allTranslations.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MyApp());
    });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Big Organizer',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
            ],
        supportedLocales: allTranslations.supportedLocales(),
        home: new Inicio(auth: new Auth(),));
  }
}
