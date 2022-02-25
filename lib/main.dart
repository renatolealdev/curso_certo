import 'package:flutter/material.dart';
import 'curso_certo.dart';

void main() {
  runApp(CursoCerto());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Curso Certo",
      home: CursoCerto(),
    );
  }
}
