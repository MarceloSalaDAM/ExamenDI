import 'package:examen_din1/src/login_views/LoginViewExamen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_views/HomeViewExamen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //declaramos las rutas que va a seguir nuetsra aplicación
    return MaterialApp(
      initialRoute: '/Login',
      routes: {
        '/Login': (context) => LoginViewExamen(),
        '/Home': (context) => HomeViewExamen(),



      },
    );
  }
}
