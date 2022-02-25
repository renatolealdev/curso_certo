import 'package:curso_certo/screens/curso_certo.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var currentWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Curso Certo",
      home: Scaffold(
        body: SafeArea(
          child: AnimatedSplashScreen(
            splash: Image.asset('images/logo_splash.png'),
            nextScreen: CursoCerto(),
            backgroundColor: Color.fromRGBO(162, 172, 171, 1),
            splashTransition: SplashTransition.slideTransition,
            splashIconSize: 200,
          ),
        ),
      ),
    );
  }
}
