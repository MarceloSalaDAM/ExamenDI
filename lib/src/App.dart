import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_din1/src/home_views/OnBoardingExamen.dart';
import 'package:examen_din1/src/login_views/LoginViewExamen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_views/Cr7ViewExamen.dart';
import 'home_views/FormularioViewExamen.dart';
import 'home_views/HomeViewExamen.dart';
import 'login_views/SplashViewExamen.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    //declaramos las rutas que va a seguir nuetsra aplicación
    return MaterialApp(
      initialRoute: '/Splash',
      routes: {
        '/Login': (context) => LoginViewExamen(),
        '/Home': (context) => HomeViewExamen(),
        '/OnBoarding': (context) => OnBoardingViewExamen(),
        '/Splash': (context) => SplashViewExamen(),
        '/Cr7View': (context) => Cr7ViewExamen(),
        '/Formulario': (context) => FormularioViewExamen(),

      },
    );
  }
}
