import 'package:flutter/material.dart';

class CursoCerto extends StatelessWidget {
  const CursoCerto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Curso Certo",
      home: Scaffold(
        body: Center(
          child: Text("Olá mundo!"),
        ),
      ),
    );
  }
}
