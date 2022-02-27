import 'dart:convert';
import 'package:curso_certo/screens/curso_certo.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:http/http.dart' as http;

import 'repository/get_fiscais.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Curso Certo",
      home: Scaffold(
        body: FutureBuilder(
          future: getFiscais(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Erro ao carregar dados! <snapshotError>"),
              );
            }

            if (snapshot.hasData) {
              return CursoCerto(apiFiscal: snapshot.data);
            }

            return AnimatedSplashScreen(
              splash: Image.asset('images/logo_splash.png'),
              nextScreen: Center(),
              disableNavigation: true,
              backgroundColor: Colors.white,
              splashTransition: SplashTransition.slideTransition,
              splashIconSize: 200,
            );
          },
        ),
      ),
    );
  }
}

//

