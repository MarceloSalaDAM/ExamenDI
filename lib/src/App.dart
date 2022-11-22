import 'package:examen_din1/src/home_views/OnBoardingExamen.dart';
import 'package:examen_din1/src/login_views/LoginViewExamen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_views/HomeViewExamen.dart';
import 'login_views/SplashViewExamen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //declaramos las rutas que va a seguir nuetsra aplicación
    return MaterialApp(
      initialRoute: '/Splash',
      routes: {
        '/Login': (context) => LoginViewExamen(),
        '/Home': (context) => HomeViewExamen(),
        '/Splash': (context) => SplashViewExamen(),
        '/OnBoarding': (context) => OnBoardingViewExamen(),




      },
    );
  }
}
